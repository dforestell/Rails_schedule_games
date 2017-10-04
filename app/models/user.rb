class User < ActiveRecord::Base
	has_many :hosted_games, class_name: :Game, foreign_key: :host_id
	has_many :away_games, class_name: :Game, foreign_key: :traveler_id

end