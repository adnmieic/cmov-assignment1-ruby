require "digest/sha2"

class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates_confirmation_of :password, :if => :perform_password_validation?
  validates_presence_of :password, :if => :perform_password_validation?
  validates_presence_of :username
  validates_uniqueness_of :username
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "64x64" }

  before_save :hash_password

  def valid_password?(password)
    self.passwordhash == self.class.hash_password(password, self.salt)
  end

  def as_json(options = {})
    options = { :only => [:id, :username, :name, :birthdate, :type] }
    if self.type == 'Doctor'
      options[:only].push(:photo)
    elsif self.type == 'Patient'
      options[:only].push(:address)
      options[:only].push(:male)
    end
    h = super(options)
    h['photo'] = self.photo.url{:thumb}
    h
  end

  private

  def self.hash_password(password, salt)
    Digest::SHA2.hexdigest(salt + password)
  end

  def hash_password
    if self.password != nil and self.password_confirmation != nil
      self.salt = ActiveSupport::SecureRandom.base64(8)
      self.passwordhash = self.class.hash_password(self.password, self.salt)
      self.password = nil
      self.password_confirmation = nil
    end
  end

  def perform_password_validation?
    if self.new_record?
      true
    else
      if self.password != nil
        !self.password.blank?
      else
        false
      end
    end
  end
end
