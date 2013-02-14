class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  attr_accessible :adults, :check_in, :check_out, :children, :user_id, :room_id
  validates_with Availability
  
  
  def self.user_reservations(user)
    where(:user_id => user.id)
  end
  
end
