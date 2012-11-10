class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :has_secure_password, :last_name
  
  has_many :pitches
end
