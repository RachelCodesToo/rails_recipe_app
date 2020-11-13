class Recipe < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  validates :recipeInstructions, presence: true
  validates :recipeName, uniqueness: true, presence: true, length: { minimum: 5 }
  validate :too_many_recipes
  
  scope :alpha, -> { order(:recipeName)}
  scope :most_reviews, -> {joins(:reviews).group('recipe.id').order('count(post.id)desc')}

  def too_many_recipes
    recipes_today = user.recipes.select do |r|
      r.created_at.try(:to_date)== Date.today 
    end 
    if recipes_today.size > 1
      errors.add(:recipe_id, " too many made for today!")
    end 
  end 

end
