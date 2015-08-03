class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
