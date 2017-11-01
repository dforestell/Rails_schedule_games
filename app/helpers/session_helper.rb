module SessionHelper
	
	def current_user
		@current_user ||= User.find_by(id: session[:id]) if session[:id]
	end

	def logged_in?
		session[:id] != nil
	end

	def authenticate!
    if !logged_in?
    	flash[:error] = "You must be logged in to do that"
    	redirect_to root_path 
    end
  end
end