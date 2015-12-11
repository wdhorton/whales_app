require_relative '../../../whales/whales_orm/lib/base'
require_relative '../../config/database.rb'
require 'bcrypt'

class User < WhalesORM::Base

  attr_reader :password

  self.finalize!

  has_many :posts

  def self.find_by_credentials(username, password)
    user = User.where(username: username).first
    user && user.valid_password?(password) ? user : nil
  end

  def initialize(attrs)
    super(attrs)
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    save
    self.session_token
  end

end
