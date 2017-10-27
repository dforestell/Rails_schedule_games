class SessionsController < ApplicationController
	
	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:id] = @user.id
			flash[:success] = "Hello, #{current_user.full_name}"
			redirect_to root_path
		else
			flash[:error] = "Invalid Username/password"
			redirect_to new_session_path
		end
	end

	def destroy
		session[:id] = nil 
		flash[:success] = "You have successfully been logged out"
		redirect_to root_path
	end
end