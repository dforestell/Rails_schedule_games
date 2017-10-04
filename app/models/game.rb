class Game < ActiveRecord::Base
	belongs_to :host, class_name: :User
	belongs_to :traveler, class_name: :User

	validates :time, :date, :field_address, :host_id, presence: true
end