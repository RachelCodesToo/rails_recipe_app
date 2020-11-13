class SessionsController < ApplicationController

    def destroy 
          session.clear
          redirect_to root_path
    end 
      

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else 
            flash[:message] = "Invalid login info, try again."
            redirect_to '/login'
        end 
    end 

    def google
        @user = User.find_by(email: auth["info"]["email"])
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end 
    end 

    private

    def auth
        request.env['omniauth.auth']
    end 




end 
