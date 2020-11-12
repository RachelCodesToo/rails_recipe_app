class User < ApplicationRecord
    has_many :recipes, foreign_key: :user_id
    has_many :reviews
    has_many :reviewed_recipes, through: :reviews, source: :recipe
    has_secure_password

    validates :username, :email, :password, presence: true

    def self.most_recipes
        joins(:recipes).group(:user_id).order("count(user_id) DESC").limit(3)
    end
    
end
