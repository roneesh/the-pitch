class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic

  has_attached_file :profilepic
  
  belongs_to :job
  belongs_to :user
  
  
end
