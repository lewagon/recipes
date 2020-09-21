class CreateRecipeCuisines < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_cuisines do |t|
      t.references :cuisine, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
