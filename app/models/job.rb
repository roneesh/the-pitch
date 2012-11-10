class Job < ActiveRecord::Base
  attr_accessible :description, :title, :employer_id
  
  def employer
    Employer.find_by_id(self.employer_id)
  end
end
