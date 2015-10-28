require_relative './application_controller.rb'
require '/Users/appacademy/desktop/Test/app/models/user.rb'

class SessionsController < ApplicationController

  def new
   render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
     login(@user)
     redirect_to '/posts'
    else
      redirect_to '/session/new'
    end
  end

  def destroy
    logout
    redirect_to '/session/new'
  end
end
