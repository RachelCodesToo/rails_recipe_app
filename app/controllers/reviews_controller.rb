class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_review, only:[:show, :edit, :update]
    before_action :redirect_if_not_review_author, only: [:edit, :update]
    
    def new
        if params[:recipe_id] && @recipe = Recipe.find_by_id(params[:recipe_id])
            @review = @recipe.comments.build
        else
            @error = "That recipe does not exist." if params[:recipe_id]
            @review = Review.new
        end 
    end 

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to reviews_path
        else 
            render :new
        end 
    end 

    def show
    end 

    def edit 
    end 

    private

    def review_params
        params.require(:review).permit(:content, :recipe_id)
    end 


    def set_review
        @review = Review.find_by(id: params[:id])
        if !@review 
            flash[:message] = "Review was not found"
            redirect_to reviews_path
        end 
    end 

    def redirect_if_not_review_author
        redirect_to reviews_path if @review.user != current_user
    end 

end
