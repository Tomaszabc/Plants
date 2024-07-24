class AddUserIdToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :user_id, :integer, foreign_key: true, null: false
  end
end
