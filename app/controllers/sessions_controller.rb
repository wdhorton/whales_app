require_relative './application_controller.rb'
require_relative '../models/user.rb'

class SessionsController < ApplicationController

  def new
   path = File.expand_path("../../assets/stylesheets/signin.css", __FILE__)
   @css = File.read(path)

   render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user]["username"],
      params[:user]["password"]
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
