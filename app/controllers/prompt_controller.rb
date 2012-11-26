class PromptController < ApplicationController
  def new
  	@prompt = Prompt.new
  end

  def create
  	@prompt = Prompt.new(params[:prompt])
  	@prompt.save

  	redirect_to edit_pitch_url(@prompt.pitch_id)
  	
  end

  def delete
    prompt = Prompt.find_by_id(params[:id])
    id = prompt.pitch_id
    prompt.destroy

    redirect_to edit_pitch_url(id)

  end

end
