class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  attr_accessible :adults, :check_in, :check_out, :children, :user_id, :room_id
  # before_create :is_reserved

  def self.is_reserved(room_id, check_in, check_out)
    # This query gets all the rooms that are available on the requested day
    rooms = Room.where("rooms.id NOT IN (SELECT reservations.room_id from reservations WHERE NOT( reservations.check_out <= ? OR reservations.check_in >= ?) )",check_in,check_out)
    # Check if the room requested is in the result set if not let the user know a reservation cannot be made on that day
    room = rooms.find { |room| room.id == room_id }
    if room.nil?
      return true
    else
      return false
    end    
  end
  
end
# SELECT
#     room.id
# FROM room
# LEFT JOIN reservations
#     ON reservations.room_id = room.id
#     AND (reservations.check_out <= ? OR reservations.check_in >= ?)
# WHERE reservations.id IS NULL
