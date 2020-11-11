class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in
    binding.pry
    def new 
       if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @recipe = @user.recipes.build
       else 
        @recipe = Recipe.new
       end 
    end 
 
    def create
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to recipes_path
        else
            render :new
        end
    end 
    
    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @recipe = @user.recipes
        else 
            @error = "That user doesn't exist" if params[:user_id]
            @recipe = Recipe.all
        end 
    end 

    

    def show 
        @recipe = Rost.find_by_id(params[:id])
        redirect_to recipes_path if !@recipe
    end 





    private

    def recipe_params
        params.require(:recipe).permit(:recipeName, :recipeInstructions)
    end

end 

