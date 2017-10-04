class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(registration_params)
		if @user.save
			session[:id] = @user.id
			redirect to 'games/available'
		else
			render 'new'
		end
	end

	def show

	end

	private

	def registration_params
		params.require(:user).permit(:full_name, :email, :team_name, :password)
	end
end	