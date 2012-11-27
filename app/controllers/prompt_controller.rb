class PromptController < ApplicationController
  def new
  	@prompt = Prompt.new

    respond_to do |f|
      f.html 
      f.js
    end

  end

  def create
  	@prompt = Prompt.new(params[:prompt])
  	@prompt.save

    respond_to do |f|
      f.html {redirect_to edit_pitch_url(@prompt.pitch_id)}
      f.js
    end

  	
  	
  end

  def delete
    prompt = Prompt.find_by_id(params[:id])
    id = prompt.pitch_id
    prompt.destroy

    redirect_to edit_pitch_url(id)

  end

end
