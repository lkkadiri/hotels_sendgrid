require 'spec_helper'
describe Availability do
  before(:each) do
    @attr = { 

    }
  end  
  it "should not let users reserve a room when booked" do
    @reservation1 = FactoryGirl.create(:reservation)
    @reservation2 = FactoryGirl.create(:reservation)
    @reservation2.should_not be_valid
  end  
end