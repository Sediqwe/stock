class SessionsController < ApplicationController
    def login
        
    end
    def logout
        session[:user_id] = nil
        redirect_to root_url, notice: "Kilépés OK!"
    end
    def controll
        
        @user = User.find_by(username: params[:user][:username])
        #render plain: @user.inspect
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Belépve!"
        else
            redirect_to login_url , error: "Helytelen felhasználó / jelszó páros!"
        end

        
    end
   
end

