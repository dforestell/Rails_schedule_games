module SessionHelper
	
	def current_user
		@current_user ||= User.find_by(id: session[:id]) if session[:id]
	end

	def logged_in?
		session[:id] != nil
	end

	def authenticate!
    redirect_to root_path unless logged_in?
  end
end