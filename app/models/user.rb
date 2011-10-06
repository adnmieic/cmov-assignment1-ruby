require "digest/sha2"

class User < ActiveRecord::Base
  validates_confirmation_of :passwordhash, :if => :perform_password_validation?
  validates_presence_of :passwordhash, :if => :perform_password_validation?

  before_save :hash_password
  attr_accessor :password

  def valid_password?(password)
    self.passwordhash == self.class.hash_password(password, self.salt)
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
    self.new_record ? true : !self.password.blank?
  end
end
