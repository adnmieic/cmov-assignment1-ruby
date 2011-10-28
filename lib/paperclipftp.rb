module Paperclip
  class Options
    
    attr_accessor :ftp_credentials, :ftp_passive_mode, :ftp_debug_mode, :ftp_verify_size_on_upload, :ftp_timeout
    
    alias_method :old_initialize, :initialize
    def initialize(attachment, hash)
      old_initialize(attachment, hash)
      @ftp_credentials = hash[:ftp_credentials]
      @ftp_passive_mode = hash[:ftp_passive_mode]
      @ftp_debug_mode = hash[:ftp_debug_mode]
      @ftp_verify_size_on_upload = hash[:ftp_verify_size_on_upload]
      @ftp_timeout = hash[:ftp_timeout]
    end
  end
  
  module Storage
    module Ftp
      class FtpTimeout < Timeout::Error; end

      def self.extended base
        require 'net/ftp'
        base.instance_eval do
          @ftp_credentials = parse_credentials(@options.ftp_credentials)
          @passive_mode = !!@options.ftp_passive_mode
          @debug_mode = !!@options.ftp_debug_mode
          @verify_size = !!@options.ftp_verify_size_on_upload
          @timeout = @options.ftp_timeout || 3600
        end
        # it is better to share and keep ftp connection because otherwise some methods (like
        # exists?, to_file etc) will open new connection each and every time without closing it - bad
        unless base.class.respond_to?(:ftp_conn)
          class << base.class; attr_accessor :ftp_conn; end
        end
      end

      def exists?(style = default_style)
        begin
          Timeout::timeout(@timeout, FtpTimeout) do
            file_size(ftp_path(style)) > 0
          end
        rescue Timeout::Error => e
          # either a true timeout or a spurious one, solution is simple, close connection and
          # re-raise exception, it is up to higher layers to retry on failure
          debug "Timed out in exists?"
          close_ftp_connection
          raise e
        end
      end

      def to_file style = default_style
        return @queued_for_write[style] if @queued_for_write[style]
        Timeout::timeout(@timeout, FtpTimeout) do
          file = Tempfile.new(ftp_path(style))
          ftp.getbinaryfile(ftp_path(style), file.path)
          file.rewind
          return file
        end
      end

      alias_method :to_io, :to_file

      def flush_writes
        @queued_for_write.each do |style, file|
          Timeout::timeout(@timeout, FtpTimeout) do
            file.close
            remote_path = ftp_path(style)
            log("uploading #{remote_path}")
            first_try = true
            begin
              ftp.putbinaryfile(file.path, remote_path)
            rescue Net::FTPPermError => e
              if first_try
                first_try = false
                create_parent_folder_for(remote_path)
                retry
              else
                raise e
              end
            end
            if @verify_size
              # avoiding those weird occasional 0 file sizes by not using instance method file.size
              local_file_size = File.size(file.path)
              remote_file_size = file_size(remote_path)
              raise Net::FTPError.new("Uploaded #{remote_file_size} bytes instead of #{local_file_size} bytes") unless remote_file_size == local_file_size
            end
          end
        end
        @queued_for_write = {}
      rescue Net::FTPReplyError => e
        raise e
      rescue Net::FTPPermError => e
        raise e
      ensure
        close_ftp_connection
      end

      def flush_deletes
        @queued_for_delete.each do |path|
          Timeout::timeout(@timeout, FtpTimeout) do
            begin
              log("deleting #{path}")
              ftp.delete('/' + path)
            rescue Net::FTPPermError, Net::FTPReplyError
            end
          end
        end
        @queued_for_delete = []
      rescue Net::FTPReplyError => e
        raise e
      rescue Net::FTPPermError => e
        raise e
      ensure
        close_ftp_connection
      end

      private

      def ftp
        if ftp_conn.nil? || ftp_conn.closed?
          Timeout::timeout(@timeout, FtpTimeout) do
            first_try = true
            begin
              debug "Creating ftp connection"
              self.class.ftp_conn = Net::FTP.new(@ftp_credentials[:host], @ftp_credentials[:username], @ftp_credentials[:password])
              ftp_conn.debug_mode = @debug_mode
              ftp_conn.passive = @passive_mode
            rescue EOFError => e
              debug "Caught EOFError (#{e.inspect})"
              if first_try
                sleep 1
                first_try = false
                retry
              else
                raise e
              end
            end
          end
        end
        ftp_conn
      end

      def close_ftp_connection
        unless ftp_conn.nil? || ftp_conn.closed?
          debug "Closing ftp connection"
          ftp_conn.close
          self.class.ftp_conn = nil
        end
      end

      def create_parent_folder_for(remote_path)
        dir_path = File.dirname(remote_path)
        ftp.chdir("/")
        dir_path.split(File::SEPARATOR).each do |rdir|
          next if rdir.blank?
          first_time = true
          begin
            ftp.chdir(rdir)
          rescue Net::FTPPermError => e
            if first_time
              ftp.mkdir(rdir)
              first_time = false
              retry
            else
              raise e
            end
          end
        end
      end

      def ftp_path(style)
        path = path(style)
        path.nil? ? nil : '/' + path
      end

      def file_size(remote_path)
        ftp.size(remote_path)
      rescue Net::FTPPermError => e
        #File not exists
        -1
      rescue Net::FTPReplyError => e
        debug "Caught Net::FTPReplyError (#{e.inspect})"
        close_ftp_connection
        raise e
      end

      def parse_credentials creds
        creds = find_credentials(creds).stringify_keys
        (creds[Rails.env] || creds).symbolize_keys
      end

      def find_credentials creds
        case creds
        when File
          YAML::load(ERB.new(File.read(creds.path)).result)
        when String, Pathname
          YAML::load(ERB.new(File.read(creds)).result)
        when Hash
          creds
        else
          raise ArgumentError, "Credentials are not a path, file, or hash."
        end
      end

      def ftp_conn
        self.class.ftp_conn
      end

      def debug(text)
        puts "PaperclipFTP: #{text}" if @debug_mode
      end
    end
  end
end
