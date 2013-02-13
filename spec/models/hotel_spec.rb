require 'spec_helper'
describe Hotel do
  describe "relations" do
    it{should have_many(:room)}
  end
  
  describe "#create_hotel" do 
    let(:hotel) { FactoryGirl.build(:hotel) }
    it "#creates a hotel" do
      hotel.should_not be_nil
    end
  end  
end
