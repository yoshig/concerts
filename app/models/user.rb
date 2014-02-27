# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  email           :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  band            :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_reader :password
  has_many :sessions, inverse_of: :user

  validates :username,
            :password,
            :password_digest,
            :email, presence: true
  validates :band, inclusion: { in: [true, false] }

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user if user && user.is_password?(password)
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
end