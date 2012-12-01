class PitchAttachmentController < ApplicationController
  def new
  	@pitch_attachment = PitchAttachment.new
  	@pitch_id = params[:pitch_id]

  	respond_to do |f|
      f.html 
      f.js
    end

  end

  def create
  	@pitch_attachment = PitchAttachment.new(params[:pitch_attachment])
  	@pitch_attachment.save

    respond_to do |f|
      f.html {redirect_to edit_pitch_url(@pitch_attachment.pitch_id)}
      f.js 
    end  	
  end

  def destroy
  	@pitch_attachment = PitchAttachment.find_by_id(params[:id])
  	@pitch_attachment.destroy

  	respond_to do |f|
  		f.html {redirect_to edit_pitch_url(@pitch_attachment.pitch_id)}
  		f.js
  	end

  end


end
