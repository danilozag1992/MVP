class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return flash[:danger] = 'Please log in.' unless logged_in?

    redirect_to login_url
  end
end
