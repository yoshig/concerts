# == Schema Information
#
# Table name: concerts
#
#  id         :integer          not null, primary key
#  tour_id    :integer
#  date       :date
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Concert < ActiveRecord::Base
  belongs_to :tour, inverse_of: :concerts
  has_many :fans, class_name: "User", foreign_key: :user_id
end
