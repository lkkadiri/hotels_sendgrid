class Notifier < ActionMailer::Base
  default :from => "reservations@leela.com"

  # Send an Email to the user thanking for the registration
  def reservation_email(user,room_id)
    room = Room.find(room_id)
    hotel_name = room.hotel.name
    name = room[:name]
    
    mail( :to => user.email,
    :subject => "Thank You",
    :body => "Thank you very much for making a reservation with us. You have been assigned the Room #{name} at the #{hotel_name}. Hope you enjoy your stay with us." )
  end
  # Send an Email to the user thanking for the registration
  def cancellation_email(user)
    mail( :to => user.email,
    :subject => "Your Room Cancellation",
    :body => "Thank you very much for notifying us about your room cancellation. Your reservation has been cancelled." )
  end
end
