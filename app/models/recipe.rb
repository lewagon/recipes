class Recipe < ApplicationRecord
  enum difficulty: { super_easy: 0, easy: 1, moderate: 2, hard: 3, very_heard: 4 }
  enum price: { cheap: 0, average: 1, expensive: 2 }
end
