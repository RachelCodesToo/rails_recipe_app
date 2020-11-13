class RecipesController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_logged_in, only: [:update, :destroy]
    
    def new 
       if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @recipe = @user.recipes.build
       else 
        @recipe = Recipe.new
       end 
       
    end 
    
    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @recipe = @user.recipes.alpha
        else 
            @error = "That user doesn't exist" if params[:user_id]
            @recipe = Recipe.alpha.includes(:user)

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
    
    def show
    end 

    def destroy
        @recipe.destroy
        redirect_to current_user
    end 

    def edit
    end 

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else 
            render :edit 
        end
    end

    private

    def set_recipe
        @recipe = Recipe.find_by(id: params[:id])
        if !@recipe
            flash[:message] = "Recipe was not found"
            redirect_to recipes_path
        end 
      end

    def recipe_params
        params.require(:recipe).permit(:recipeName, :recipeInstructions)
    end

    def redirect_if_not_logged_in
        redirect_to recipes_path if @recipe.user != current_user
    end 

end 

