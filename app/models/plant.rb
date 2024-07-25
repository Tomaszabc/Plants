class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_logs, dependent: :destroy
  has_one :watering_reminder, dependent: :destroy

  def water
    update( watered_at: Time.current )
    WateringLog.create(plant: self)
  end
end
