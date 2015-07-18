class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def signin
  end

  def logout
    @user = nil
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      flash[:success] = "Welcome to Bloccit!"
      redirect_to @user
    else
      render :new
    end
  end
end
