class UsersController < ApplicationController

	def new 
		@user = User.new
	end

	def create 
		@user = User.new(registration_params)
		if @user.save
			session[:id] = @user.id
			flash[:success] = "Welcome Aboard, lets schedule some games!"
			redirect_to games_path
		else
			flash[:error] = @user.errors.full_messages.to_sentence
			redirect_to new_user_path
		end
	end

	def show
		user = User.find(params[:id])
		if user == current_user
			@user = user
			@away_games = @user.away_games
			@pending_games = Game.where(host_id: current_user.id, traveler_id: nil)
			@home_games = Game.where(host_id: current_user.id).where.not(traveler_id: nil)
		else
			flash[:error] = "That page doesn't belong to you"
			redirect_to root_path
		end
	end

	def index
	end

	private

	def registration_params
		params.require(:user).permit(:full_name, :email, :team_name, :password)
	end
end	