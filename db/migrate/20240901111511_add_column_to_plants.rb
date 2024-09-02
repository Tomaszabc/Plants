class AddColumnToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :note, :text
    add_column :plants, :light_requirements, :integer
    add_column :plants, :water_needs, :integer
    add_column :plants, :fertilization_needs, :text
    add_column :plants, :toxicity, :integer
    add_column :plants, :date_acquired, :datetime
  end
end
