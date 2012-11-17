class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic, :url_string

  has_attached_file :profilepic
  
  belongs_to :job
  belongs_to :user  
  
  
  
  def url_string
    return          "localhost:3000/#{self.user.id}/#{self.id}/a-pitch-from/#{self.user.first_name}"
    end

end
