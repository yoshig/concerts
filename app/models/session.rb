# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Session < ActiveRecord::Base
  validates :token, presence: true
  before_validation :ensure_token
  belongs_to :user, inverse_of: :sessions


  def reset_token!
    self.token = tokenize
    self.save
    self.token
  end

  def tokenize
    SecureRandom.urlsafe_base64
  end

  def ensure_token
    self.token ||= tokenize
  end
end
