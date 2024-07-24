class WateringLog < ApplicationRecord
  belongs_to :plant

  validates :watering_time, presence: true
end
