class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if @current_user == nil
    redirect_to("/login")
    end
  end

end
