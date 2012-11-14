class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :password, :password_confirmation, :last_name,  :linkedin_script, :password_digest
  
  has_secure_password

  has_many :pitches
end
