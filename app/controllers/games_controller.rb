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
		@open_games = Game.where(traveler_id: nil).where.not(host_id: current_user.id)
		@games = @open_games.future.sort_by &:date
	end

	def show
		@game = Game.find(params[:id])
	end 

	def destroy
		@game = Game.find(params[:id])
		@game.destroy
		respond_to do |format|
    format.html { redirect_to user_path(current_user) }
    format.js   { } 
    end
  end


	def update
		authenticate!
		@game = Game.find(params[:id])
		@game.update(traveler_id: current_user.id)
		redirect_to game_path(@game)
	end

private
	def new_game
		params.require(:game).permit(:time, :date, :field_address)
	end

end