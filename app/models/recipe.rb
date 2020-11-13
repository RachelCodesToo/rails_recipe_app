class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :recipeInstructions, presence: true
  validates :recipeName, uniqueness: true, presence: true, length: { minimum: 5 }
  
  scope :alpha, -> { order(:recipeName)}
  scope :most_reviews, -> {joins(:reviews).group('recipe.id').order('count(post.id)desc')}


end
