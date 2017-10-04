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

end	