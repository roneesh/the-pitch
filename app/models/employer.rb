class Employer < ActiveRecord::Base
  attr_accessible :description, :name, :email, :password, :password_confirmation
  
  has_secure_password

  has_many :pitches, :through => :jobs
  

  def job
    Job.where(:employer_id => self.id )
  end
end
