require_relative './application_controller.rb'
require_relative '../models/user.rb'

class UsersController < ApplicationController

  def new
    path = File.expand_path("../../assets/stylesheets/signin.css", __FILE__)
    @css = File.read(path)

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to '/posts'
    else
      flash.now[:errors] = ["Couldn't create new user."]
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
