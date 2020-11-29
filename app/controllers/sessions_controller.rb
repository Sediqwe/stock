class SessionsController < ApplicationController
    def login
    end
    def controll
        
        @user = User.where(username: params[:user][:username] )
        #render plain: user.inspect
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Logged in!"
        else
            flash.now[:alert] = "Email or password is invalid"
            render 'login'
        end

        
    end
   
end

