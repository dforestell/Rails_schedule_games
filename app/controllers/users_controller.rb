class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(registration_params)
		if @user.save
			session[:id] = @user.id
			redirect_to games_path
		else
			render 'new'
		end
	end

	def show
		authenticate!
		@user = current_user
		@hosted_games = @user.hosted_games.where("traveler_id = nil")
		@away_games = @user.away_games
		@home_games = @user.hosted_games.where("traveler_id != nil")
	end

	private

	def registration_params
		params.require(:user).permit(:full_name, :email, :team_name, :password)
	end
end	