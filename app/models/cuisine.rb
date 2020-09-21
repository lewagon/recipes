class Cuisine < ApplicationRecord
  has_many :recipes, dependent: :destroy
end
