class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    user = User.find_by(id: self.user_id)
    attraction = Attraction.find_by(id: self.attraction_id)
    msg_height = "You are not tall enough to ride the #{attraction.name}."
    msg_tickets = "You do not have enough tickets to ride the #{attraction.name}."

    if user.tickets < attraction.tickets and user.height < attraction.min_height
      "Sorry. #{msg_tickets} #{msg_height}"
    elsif user.tickets < attraction.tickets
      "Sorry. #{msg_tickets}"
    elsif user.height < attraction.min_height
      "Sorry. #{msg_height}"
    else
      # binding.pry
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    end
  end

end
