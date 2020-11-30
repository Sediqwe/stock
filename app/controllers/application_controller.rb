class ApplicationController < ActionController::Base
helper_method :current_user  
add_flash_types :info, :error, :warning
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
    end
  end
  private

  def authorized?
    return if current_user.present?

    flash[:error] = 'Na előbb lépjél be légyszi.'
    redirect_to login_path
  end
end
