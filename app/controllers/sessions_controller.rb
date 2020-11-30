class SessionsController < ApplicationController
    def login
    end
    def controll
        
        @user = User.find_by_username(params[:user][:username])
        #render plain: @user.inspect
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Belépve!"
        else
            redirect_to login_url , error: "Helytelen felhasználó / jelszó páros!"
        end

        
    end
   
end

