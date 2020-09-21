class RecipeCuisine < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe
end
