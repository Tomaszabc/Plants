require 'csv'

class Plant < ApplicationRecord
  belongs_to :user
  has_many :watering_logs, dependent: :destroy
  has_one :watering_reminder, dependent: :destroy
  has_one_attached :plant_image, dependent: :destroy

  def water(time = Time.current)
    update(watered_at: time)
    WateringLog.create(plant: self, created_at: time)
  end

  def next_watering
    return nil unless watering_reminder
    if watered_at
      last_watering_log = watering_logs.order(:created_at).last
      if last_watering_log
        last_watering_log.created_at + watering_reminder.frequency.hours
      end
    else
      watering_reminder.created_at + watering_reminder.frequency.hours
    end
  end

  def needs_watering?
    next_watering&.present?
  end

  def self.to_csv(plants)
    attributes = %w{id name watered_at watering_frequency}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      plants.each do |plant|
        csv << [
          plant.id,
          plant.name,
          plant.watered_at.strftime('%Y-%m-%d %H:%M:%S'),
          plant.watering_reminder ? "#{plant.watering_reminder.quantity} #{plant.watering_reminder.unit}" : nil
        ]
      end
    end
  end
end
