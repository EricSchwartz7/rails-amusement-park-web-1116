class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_admin?



  def current_user
    if logged_in?
      @user ||= User.find(session[:user_id])
    end
  end

  def authorize_user
    unless logged_in?
      flash[:notice] = "You must be logged in"
      redirect_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def is_admin?
    !!(current_user && current_user.admin)
  end
end
