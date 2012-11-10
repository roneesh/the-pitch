class  PitchController < ApplicationController
  def index
  	@pitches = Pitch.all
  end

  def show
  	@pitch = Pitch.find_by_id(params[:id])
  end

  def new
  	@pitch = Pitch.new
  end

  def create
  	@pitch = Pitch.new(params[:pitch])
  	@pitch.save
  	redirect_to pitches_url
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
  	redirect_to pitches_url
  end


end