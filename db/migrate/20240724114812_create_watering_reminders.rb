class CreateWateringReminders < ActiveRecord::Migration[7.0]
  def change
    create_table :watering_reminders do |t|
      t.integer :frequency

      t.timestamps
    end
  end
end
