require_relative './application_controller'
require_relative '../models/user'

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

  def index
    path = File.expand_path("../../assets/stylesheets/post_index.css", __FILE__)
    @css = File.read(path)

    @users = User.all
    render :index
  end

  def show
    path = File.expand_path("../../assets/stylesheets/post_index.css", __FILE__)
    @css = File.read(path)

    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
