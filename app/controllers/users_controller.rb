class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(registration_params)
		if @user.valid?
			session[:id] = @user.id
			redirect_to games_path
		else
			render 'new'
			flash[:error] = @user.errors.full_messages.each { |err| err }
		end
	end

	def show

	end

	private

	def registration_params
		params.require(:user).permit(:full_name, :email, :team_name, :password)
	end
end	