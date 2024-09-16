class ChangeLightandWateringToBeStringInPlants < ActiveRecord::Migration[7.0]
  def up
    change_column :plants, :water_needs, :string
    change_column :plants, :light_requirements, :string
  end

  def down
    change_column :plants, :water_needs, :integer
    change_column :plants, :light_requirements, :integer
  end
end
