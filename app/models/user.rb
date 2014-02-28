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
  has_one :band, inverse_of: :user
  has_many :followed_bands, class_name: "Band", foreign_key: :user_id
  has_many :friends, class_name: "User", foreign_key: :user_id

  validates :username,
            :password_digest,
            :email, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :is_a_band, inclusion: { in: [true, false] }

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user if user && user.is_password?(password)
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_a_band?
    self.is_a_band
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
end