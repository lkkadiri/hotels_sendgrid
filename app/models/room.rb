class Room < ActiveRecord::Base
  belongs_to :hotel
  attr_accessible :bedrooms, :beds, :booking_status, :fridge, :microwave, :name, :nightly_rate, :sauna, :smoke_free, :television, :hotel_id
  validates :bedrooms, :numericality => { :greater_than => 0 }
  validates :beds, :numericality => { :greater_than => 0 }
  
  
  def self.show_available(hotel_id)
    
    p hotel_id
    rooms = Room.find(:all, :conditions =>{:hotel_id => hotel_id, :booking_status => false })
  end
end
