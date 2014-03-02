# == Schema Information
#
# Table name: tours
#
#  id         :integer          not null, primary key
#  band_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  end_date   :date
#  start_date :date
#

class Tour < ActiveRecord::Base
  belongs_to :band, inverse_of: :tours
  has_many :concerts, inverse_of: :tour
  has_one :user, through: :band
  validate :start_date_before_end_date

  private
  def start_date_before_end_date
    errors.add(:dates, "must be in order") if self.start_date > self.end_date
  end
end
