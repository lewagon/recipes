class Cuisine < ApplicationRecord
  has_many :recipe_cuisines, dependent: :destroy
  has_many :recipes, through: :recipe_cuisines
end
