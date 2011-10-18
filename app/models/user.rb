require "digest/sha2"

class User < ActiveRecord::Base
  attr_accessor :password
  validates_confirmation_of :password, :if => :perform_password_validation?
  validates_presence_of :password, :if => :perform_password_validation?
  validates_presence_of :username
  validates_uniqueness_of :username

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
    super(options)
  end

  private

  def self.hash_password(password, salt)
    Digest::SHA2.hexdigest(salt + password)
  end

  def hash_password
    self.salt = ActiveSupport::SecureRandom.base64(8)
    self.passwordhash = self.class.hash_password(self.password, self.salt)
  end

  def perform_password_validation?
    self.new_record? ? true : !self.password.blank?
  end
end
