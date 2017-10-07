class Game < ActiveRecord::Base
	belongs_to :host, class_name: :User
	belongs_to :traveler, class_name: :User, optional: true

	validates :time, :date, :field_address, presence: true
end