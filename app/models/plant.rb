class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_logs, dependent: :destroy
  has_one :watering_reminder, dependent: :destroy

  def water(time = Time.current)
    update( watered_at: time )
    WateringLog.create(plant: self, created_at: time)
  end

  def next_watering
    return nil unless watering_reminder
    if watered_at
      last_watering_log = watering_logs.order(:created_at).last
      if last_watering_log
        last_watering_log.created_at + watering_reminder.frequency.hours
      else
        nil
      end
    else
      watering_reminder.created_at + watering_reminder.frequency.hours
    end
  end
end
