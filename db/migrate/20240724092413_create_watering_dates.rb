class CreateWateringDates < ActiveRecord::Migration[7.0]
  def change
    create_table :watering_logs do |t|
      t.datetime :watering_time
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
