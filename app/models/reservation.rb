class Reservation < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  attr_accessible :adults, :check_in, :check_out, :children
end
