class Ride < ApplicationRecord
	belongs_to :attraction
	belongs_to :user

	def take_ride
		@message = nil
		if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
			@message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
		elsif self.user.tickets < self.attraction.tickets
			@message = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
		elsif self.user.height < self.attraction.min_height
			@message = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
		else 
			self.user.tickets -= self.attraction.tickets
			self.user.nausea += self.attraction.nausea_rating
			self.user.happiness += self.attraction.happiness_rating
			self.user.save
			@message = "Thanks for riding the #{self.attraction.name}!"
		end
		@message
	end

end
