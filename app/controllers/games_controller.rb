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
		@games.future.sort_by &:date
	end

end

private
	def new_game
		params.require(:game).permit(:time, :date, :field_address)
	end