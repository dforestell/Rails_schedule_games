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
		@away_games = @user.away_games
		@pending_games = []
		@home_games = []
		@user.hosted_games.each do |game|
			if game.traveler == nil
				@pending_games << game 
			else
				@home_games << game 
			end
		end
	end

	def index
	end

	private

	def registration_params
		params.require(:user).permit(:full_name, :email, :team_name, :password)
	end
end	