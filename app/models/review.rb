class Review < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    validates :content, presence: true
    
    validates :recipe, uniqueness: {scope: :user_id, message: "Only one review per user"}
    
end
