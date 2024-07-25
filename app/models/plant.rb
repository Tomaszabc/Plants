class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_logs, dependent: :destroy
  has_one :watering_reminder, dependent: :destroy

  def water
    update( watered_at: Time.current )
    WateringLog.create(plant: self)
  end

  def next_watering
    return nil unless watering_reminder
    if watered_at
      watered_at + watering_reminder.frequency.hours
    else
      watering_reminder.created_at + watering_reminder.frequency.hours
    end
  end

end
