class PitchAttachment < ActiveRecord::Base
  attr_accessible :pitch_id, :user_id, :attachment, :name, :description

  mount_uploader :attachment, AttachmentUploader

  belongs_to :pitch

end
