class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :password, :password_confirmation, :last_name
  
  has_secure_password

  has_many :pitches
end
