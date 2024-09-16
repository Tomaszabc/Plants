class ChangeToxicityToBeStringInPlants < ActiveRecord::Migration[7.0]
  def up
    change_column :plants, :toxicity, :string
  end

  def down
    change_column :plants, :toxicity, :integer
  end
end
