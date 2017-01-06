class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if session[:user_id].nil?
      redirect_to root_path
    else
      @user = User.find(params[:id])
    end
  end

  def edit

  end

  def update
    
  end

  def index
    #code
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness,
    :nausea, :tickets, :password, :admin)
  end

  def authenticate_user
    #code
  end

  def current_user
    #code
  end
end
