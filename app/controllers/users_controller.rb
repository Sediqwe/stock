class UsersController < ApplicationController
  before_action :authorized?, only: [:index]
  def index
    @user = User.all
  end
  def new
    @user = User.new
  end
 

  def create   
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id   
      redirect_to '/'
    else
      render 'new'
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
