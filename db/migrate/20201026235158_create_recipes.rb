class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipeName
      t.text :recipeInstructions
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
