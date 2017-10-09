class GamesController < ApplicationController

	def new
		authenticate!
		@game = Game.new
	end

	def create
		authenticate!
		@game = Game.new(new_game)
		@game.host_id = current_user.id

		if @game.save
			redirect_to @game 
		else
			redirect_to root_path
		end
	end

	def index
		@games = Game.where(traveler_id: nil)
		@games = @games.future.sort_by &:date
	end

	def show
		@game = Game.find(params[:id])
	end 

	def destroy
		@game = Game.find(params[:id])
		@game.destroy
		#flash "game has been deleted"
		redirect_to user_path(current_user)
	end

	def update
		authenticate!
		@game = Game.find(params[:id])
		@game.update(traveler_id: current_user.id)
		redirect_to game_path(@game)
	end

end

private
	def new_game
		params.require(:game).permit(:time, :date, :field_address)
	end