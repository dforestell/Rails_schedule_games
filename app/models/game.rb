class Game < ActiveRecord::Base
	belongs_to :host, class_name: :User
	belongs_to :traveler, class_name: :User, optional: true

	validates :time, :date, :field_address, presence: true

	def format_date
  	str_time = self.date + " " + self.time
    time = Time.parse(str_time)
    time.strftime("%A, %B %d, %l:%M %p, %Y")
  end

	def self.future
    where("date > ?", Time.current)
  end
end