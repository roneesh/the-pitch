class UsersController < ApplicationController

 before_filter :ensure_logged_in
 before_filter :ensure_correct_user_type
 before_filter :ensure_correct_user_id, only: [:show, :edit]

  def ensure_correct_user_type
    if session[:employer_id]
      flash[:message] = "Employers can not view any User pages"
      redirect_to user_url(session[:user_id])
    end
  end

  def ensure_correct_user_id
    if session[:user_id] != params[:id].to_i
      flash[:message] = "You are not authorized to see/edit/delete any other User's user information."
      redirect_to user_url(session[:user_id])
      return
    end
  end

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
    if @user.save
      GeneralMailer.user_signup_confirmation(@user).deliver
      flash[:message] = "Thanks for signing up, a confirmation e-mail has been sent to #{@user.email}, please login."
      redirect_to userlogin_url
    end
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
