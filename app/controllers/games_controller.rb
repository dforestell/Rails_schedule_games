class GamesController < ApplicationController
	def new
		if logged_in?
			@game = Game.new
		else
			redirect_to root_path
		end
	end

end
