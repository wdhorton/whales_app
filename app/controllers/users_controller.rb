require_relative './application_controller.rb'
require '/Users/appacademy/desktop/Test/app/models/user.rb'

class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    # I know this is a major security issue, but I will implement strong params
    @user = User.new(params[:user])

    if @user.save
      login(@user)
      redirect_to '/posts'
    else
      flash.now[:errors] = ["Couldn't create new user."]
      render :new
    end
  end

end
