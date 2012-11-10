class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :has_secure_password, :last_name
  
end
