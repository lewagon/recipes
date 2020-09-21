class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.integer :difficulty
      t.integer :cooktime
      t.integer :price
      t.boolean :vegetarian, default: false, null: false
      t.boolean :vegan, default: false, null: false
      t.string :image_url
      t.boolean :healthy, default: false, null: false
      t.boolean :gluten_free, default: false, null: false

      t.timestamps
    end
  end
end
