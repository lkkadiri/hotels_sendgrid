class Notifier < ActionMailer::Base
  default :from => "reservations@leela.com"

  # send a signup email to the user, pass in the user object that contains the user's email address
  def reservation_email(user,room_id)
    room = Room.find(room_id)
    hotel_name = room.hotel.name
    name = room[:name]
    
    mail( :to => user.email,
    :subject => "Thank You",
    :body => "Thank you very much for making a reservation with us. You have been assigned the Room #{name} at the #{hotel_name}. Hope you enjoy your stay with us." )
  end
end
