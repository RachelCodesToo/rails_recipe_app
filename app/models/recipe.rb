class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :recipeName, :recipeInstructions, presence: true
  
  scope :alpha, -> { order(:recipeName)}
  scope :most_reviews, -> {left_joins(:reviews).group('recipes.id').order('count(reviews.recipe_id) desc')}

  

end
