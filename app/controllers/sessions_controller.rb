class SessionsController < ApplicationController


    def new
    end 


    def destroy 
        session.clear
        redirect_to root_path
    end 

    def create
        @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else 
            flash[:message] = "Invalid login info, try again."
            render :new
        end 
    end 
end 
