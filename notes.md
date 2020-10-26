Recipe app

Recipe  **join table joining categories and user 
belongs_to :user
has_many :reviews
has_many :users, through :reviews
belongs_to :category 
recipeName
recipeInstructions


(cookTime
cookingMethod
recipeIngredient
recipeCategory)



User
has_many :recipes
has_many :reviews 
has_many :reviewed_recipes, through :reviews
has_many :categories, through: :recipes
username 
email 
password_digest


Review (join table)  **joining users and reviews ** here's a list of users who have reviewed the recipe
belongs_to :user
belongs_to :recipe
content


Category 
- name 
- has_many :recipes
- has_many users, through: :recipes

