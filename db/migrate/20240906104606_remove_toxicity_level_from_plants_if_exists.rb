class RemoveToxicityLevelFromPlantsIfExists < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :toxicity_level, :integer, if_exists: true
  end
end
