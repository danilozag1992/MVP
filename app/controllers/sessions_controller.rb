class SessionsController < ApplicationController
  def new;
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      flash[:notice] = "Logged in"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = "Logged out"
    redirect_to root_url
  end
end
