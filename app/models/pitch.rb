class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic

  has_attached_file :profilepic
  
end
