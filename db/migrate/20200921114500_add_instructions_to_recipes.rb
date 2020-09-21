class AddInstructionsToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :instructions, :text
  end
end
