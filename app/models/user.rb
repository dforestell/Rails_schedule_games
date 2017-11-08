class User < ActiveRecord::Base
	has_many :hosted_games, class_name: :Game, foreign_key: :host_id
	has_many :away_games, class_name: :Game, foreign_key: :traveler_id

	validates :full_name, :email, :team_name, :password, presence: true
	validates :email, :team_name, uniqueness: true

	has_secure_password
end