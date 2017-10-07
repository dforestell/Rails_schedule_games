class GamesController < ApplicationController
	def new
		authenticate!
		@game = Game.new
	end

end
