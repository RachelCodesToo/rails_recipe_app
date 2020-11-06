class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new 
        @recipe = Recipe.new
    end 

    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end 

    private

    def recipe_params
        params.require(:recipe).permit(:recipeName, :recipeInstructions)
    end 


end
