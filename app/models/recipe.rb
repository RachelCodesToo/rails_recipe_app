class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :recipeName, :recipeInstructions, presence: true
  
  scope :alpha, -> { order(:recipeName)}
  scope :most_reviews, -> {joins(:reviews).group('recipe.id').order('count(post.id)desc')}

end
