class AddUnitToWateringReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :watering_reminders, :unit, :string, null: false
    add_column :watering_reminders, :quantity, :integer, null: false
  end
end
