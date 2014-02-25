class User < ActiveRecord::Base
  attr_reader :password

  validates :username,
            :password,
            :password_digest,
            :email, presence: true
  before_validation do
    ensure_token
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?
  end

  def reset_token!
    self.token = RandomSecure.urlsafe_base64
    self.save
    self.token
  end

  def ensure_token
    self.token ||= reset_token!
  end
end
