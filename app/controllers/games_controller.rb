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
			flash[:error] = @game.errors.full_messages.to_sentence
			redirect_back(fallback_location: root_path)
		end
	end

	def index
		if logged_in?
			@open_games = Game.where(traveler_id: nil).where.not(host_id: current_user.id)
			@games = @open_games.future.sort_by &:date
		else
    	flash[:error] = "You must be logged in to do that"
    	redirect_to root_path 
    end
	end

	def show
		authenticate!
		@game = Game.find(params[:id])
	end 

	def destroy
		@game = Game.find(params[:id])
		if current_user.id == @game.host_id
			@game.destroy
			respond_to do |format|
	    	format.html { redirect_to user_path(current_user) }
	    	format.js   { } 
	    end
	  else
	  	flash[:error] = "You can't delete other peoples games!"
	  	redirect_back(fallback_location: root_path)
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