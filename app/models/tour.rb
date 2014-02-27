# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tour < ActiveRecord::Base
  belongs_to :band, inverse_of: :tours
  has_many :concerts, inverse_of: :tour
end
