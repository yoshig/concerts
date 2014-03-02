# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base
  belongs_to :user, inverse_of: :band
  has_many :tours, inverse_of: :band
  has_many :concerts, through: :tours

  validates :user, :name, presence: true
end