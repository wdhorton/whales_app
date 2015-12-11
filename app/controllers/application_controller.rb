require_relative 'whales_actions'
require_relative '../models/user.rb'
require_relative '../../config/database.rb'

class ApplicationController < WhalesController::Base

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.where(session_token: session[:session_token]).first
  end

  def ensure_logged_in
    unless logged_in?
      redirect_to '/sessions/new'
    end
  end

  def render(template_name)
    file_location = __FILE__
    super(template_name, file_location)
  end
end
