class Attachment < ActiveRecord::Base
  attr_accessible :pitch_id, :resource_url, :picture

  has_attached_file :photo
end
