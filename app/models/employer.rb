class Employer < ActiveRecord::Base
  attr_accessible :description, :name, :email, :password, :password_confirmation, :password_digest
  
  has_secure_password

  has_many :pitches, :through => :jobs
  
  validates_presence_of :email, :password, :password_confirmation
  

  def job
    Job.where(:employer_id => self.id )
  end
end
