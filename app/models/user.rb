class User < ApplicationRecord
    has_many :recipes, foreign_key: :user_id
    has_many :reviews
    has_many :reviewed_recipes, through: :reviews, source: :recipe
    has_secure_password

    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true 

    
end
