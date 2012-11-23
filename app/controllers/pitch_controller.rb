class  PitchController < ApplicationController

before_filter :ensure_logged_in, except: [:short_url]
before_filter :ensure_correct_user_id, only: [:show, :edit]

  def ensure_correct_user_id
    if session[:user_id] != Pitch.find_by_id(params[:id]).user_id
      flash[:message] = "You are not authorized to see/edit/delete any other User's user information."
      redirect_to user_url(session[:user_id])
    end
  end
  
  def index
  	@pitches = Pitch.all
  end

  def show
  	@pitch = Pitch.find_by_id(params[:id])
  end

  def new
  	@pitch = Pitch.new
    @job_id = params[:job_id]
  end

  def create
  	@pitch = Pitch.new(params[:pitch])
  	@pitch.job_id = params[:job_id]
    @pitch.user_id = session[:user_id]
    @pitch.save
    flash[:message] = "Pitch created, access it in your Dashboard"
  	redirect_to user_url(session[:user_id])
  end

  def edit
  	@pitch = Pitch.find_by_id(params[:id])
  end

  def update
  	@pitch = Pitch.find_by_id(params[:id])
  	@pitch.update_attributes(params[:pitch])
  	redirect_to pitch_url(@pitch.id)
  end

  def destroy
  	@pitch = Pitch.find_by_id(params[:id])
  	@pitch.destroy
  	redirect_to user_url(session[:user_id])
  end
  
  def email
    #@email = Pitch.find_by_id(params[:id]).user.email
    @pitch = Pitch.find_by_id(params[:id])
    GeneralMailer.coffee_email(@pitch).deliver
    flash[:message] = "E-mail was sent!"
    redirect_to pitch_url(@pitch.id)
  end

  def short_url
    
    @pitch = Pitch.where( :user_id => params[:userid], :id => params[:pitchid]).first
  
  end

end