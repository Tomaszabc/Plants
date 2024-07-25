class AddPlantIdToWateringReminders < ActiveRecord::Migration[7.0]
  def change
    add_reference :watering_reminders, :plant, foreign_key: true, null: false
  end
end
