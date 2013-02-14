require 'spec_helper'
describe Reservation do  
  describe "relations" do
    it{should belong_to(:room)}
    it{should belong_to(:user)}
  end
  describe "#create_reservation" do 
    let(:reservation) { FactoryGirl.build(:reservation) }
    it "#creates a reservation" do
      reservation.should_not be_nil
    end
  end  
  describe "is_reserved?" do
    it "should return false" do 

    end
  end

end