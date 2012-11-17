class Pitch < ActiveRecord::Base
  attr_accessible :headline, :job_id, :user_id, :profilepic, :url_string

  has_attached_file :profilepic
  
  
  belongs_to :job
  belongs_to :user
  
  def url_string
    return  "localhost:3000/#{self.job_id}/#{self.user_id}/#{self.user.first_name}/pitch-for/#{self.job.employer.name}"
  
  #/*jobid/*userid/*firstname/pitch-for/*company'
  
  end

end
