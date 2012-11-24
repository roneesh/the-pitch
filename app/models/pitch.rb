class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic, :url_string, :avatar, :remove_avatar

  has_attached_file :profilepic
  
  belongs_to :job
  belongs_to :user  
  
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :headline
  
  def url_string
    return "localhost:3000/#{self.user.id}/#{self.id}/a-pitch-from/#{self.user.first_name}"
  end

end
