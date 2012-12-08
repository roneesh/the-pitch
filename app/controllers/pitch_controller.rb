class  PitchController < ApplicationController

before_filter :ensure_logged_in, except: [:short_url]
before_filter :ensure_correct_user_id, only: [:show, :edit]


  def ensure_correct_user_id
    if session[:user_id] != Pitch.find_by_id(params[:id]).user_id
      flash[:message] = "You are not authorized to see/edit/delete any other User's user information."
      redirect_to user_url(session[:user_id])
    end
  end
  
  def destroy_pitch_attachments(id)
    pitch = Pitch.find_by_id(id)
    attachments = pitch.pitch_attachments
    attachments.destroy_all
  end

  def index
  	@pitches = Pitch.all
  end

  def show
  	@pitch = Pitch.find_by_id(params[:id])
    @prompts = @pitch.prompts
    @prompt_sample = @pitch.prompts.sample
    @pitch_attachments = @pitch.pitch_attachments
    @even_index_prompts = prompts.values_at(* prompts.each_index.select {|i| i.even?})
    @odd_index_prompts = prompts.values_at(* prompts.each_index.select {|i| i.odd?})
  end

  def new
  	@pitch = Pitch.new
    @job_id = params[:job_id]
    @prompt = Prompt.new
    @prompts = @pitch.prompts
    if @job_id == nil
      flash[:message] = "Current Pitch will not be linked to a job, the only way to have someone view it will be to send them the unique view link at the bottom of the Pitch."
    end
  end

  def create
  	@pitch = Pitch.new(params[:pitch])
  	@pitch.job_id = params[:job_id]
    @pitch.user_id = session[:user_id]
    if @pitch.save
      flash[:message] = "Pitch created and added to dashboard, now add prompts and attachments"
  	  redirect_to edit_pitch_url(@pitch.id)
    else 
      render 'new'
    end
  end

  def edit
  	@pitch = Pitch.find_by_id(params[:id])
    @prompt = Prompt.new
    @prompt_pitch_id = @pitch.id
    @prompts = @pitch.prompts
    @pitch_attachments = @pitch.pitch_attachments
  end

  def update
  	@pitch = Pitch.find_by_id(params[:id])
  	@pitch.update_attributes(params[:pitch])
  	redirect_to pitch_url(@pitch.id)
  end

  def destroy
  	@pitch = Pitch.find_by_id(params[:id])
    prompts = @pitch.prompts
    destroy_pitch_attachments(params[:id])
  	@pitch.destroy
    prompts.destroy_all
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
    prompts = @pitch.prompts
    @prompts = prompts
    @prompt_sample = @prompts.sample
    @pitch_attachments = @pitch.pitch_attachments
    @even_index_prompts = prompts.values_at(* prompts.each_index.select {|i| i.even?})
    @odd_index_prompts = prompts.values_at(* prompts.each_index.select {|i| i.odd?})
    @marker = true

    render 'short_url_alternate'

  end


end
