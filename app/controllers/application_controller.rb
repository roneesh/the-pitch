class ApplicationController < ActionController::Base
  protect_from_forgery

	def ensure_logged_in
   		if !session[:employer_id] && !session[:user_id]
      		flash[:message] = "Please log-in first."
      		redirect_to root_url
    	end
	end

end
