class Game < ActiveRecord::Base
	belongs_to :host, class_name: :User
	belongs_to :traveler, class_name: :User, optional: true

	validates :time, :date, :field_address, presence: true

	def self.future
    where("starts_at > ?", Time.current)
  end
end