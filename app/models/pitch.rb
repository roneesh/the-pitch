class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic, :url_string, :avatar, :remove_avatar, :resume, :remove_resume

  has_attached_file :profilepic
  
  belongs_to :job
  belongs_to :user
  has_many :prompts  
  has_many :pitch_attachments
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :resume, ResumeUploader

  validates_presence_of :headline
  
  def url_string
    return "localhost:3000/#{self.user.id}/#{self.id}/a-pitch-from/#{self.user.first_name}"
  end

end
