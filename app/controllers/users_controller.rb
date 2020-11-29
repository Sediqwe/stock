class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
 

  def create   
    @user = User.create(user_params)
    @user.username =  @user.username.downcase
    if @user.save
      session[:user_id] = @user.id   
      redirect_to '/'
    else
      render @user
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  private
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
   
end
