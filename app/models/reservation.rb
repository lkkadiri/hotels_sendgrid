class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  attr_accessible :adults, :check_in, :check_out, :children, :user_id, :room_id
  before_create :is_reserved?

  def is_reserved?
    rooms = Room.where("rooms.id NOT IN (SELECT reservations.room_id from reservations WHERE NOT( reservations.check_out <= ? OR reservations.check_in >= ?) )",check_in,check_out)
    room = rooms.find { |room| room.id == self.room_id }
    if room.nil?
      p "The room is not vacant"
    end    
  end
  
end
