class AddUniqueIndexToWateringReminders < ActiveRecord::Migration[7.0]
  def change
    remove_index(:watering_reminders, :plant_id)
    add_index(:watering_reminders, :plant_id, unique: true)
  end
end
