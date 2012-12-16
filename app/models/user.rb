class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :linkedin_script, :password_digest, :twitter_handle
  
  has_secure_password
  
  validates_presence_of :email, :first_name, :last_name, :password, :password_confirmation
  validates_uniqueness_of :email

  has_many :pitches
end
