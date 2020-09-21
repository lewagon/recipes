class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipe_cuisines, dependent: :destroy
  has_many :cuisines, through: :recipe_cuisines

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :difficulty, presence: true
  validates :cooktime, presence: true
  validates :vegetarian, inclusion: { in: [true, false] }
  validates :vegan, inclusion: { in: [true, false] }
  validates :gluten_free, inclusion: { in: [true, false] }
  validates :healthy, inclusion: { in: [true, false] }

  enum difficulty: { very_easy: 0, easy: 1, moderate: 2, hard: 3, very_hard: 4 }
  enum price: { cheap: 0, medium: 1, expensive: 2 }

  NUMBER = 1000

  def image
    image_url? ? image_url : 'food.svg'
  end
end
