class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect_to users_path
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(params[:user])
    redirect_to user_url
  end
 
  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to users_url
  end
 


end
