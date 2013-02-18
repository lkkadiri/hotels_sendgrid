require 'spec_helper'
describe Hotel do
  describe "relations" do
    it{should have_many(:room)}
  end
  before(:each) do
    @attr = { 

    }
  end
  describe "#create_hotel" do 
    let(:hotel) { FactoryGirl.build(:hotel) }
    it "#creates a hotel" do
      hotel.should_not be_nil
    end
    it "should not let users enter invalid email during a hotel creation" do
        lambda do
          @hotel = FactoryGirl.create(:hotel, @attr.merge(:email => 'blah'))
          @hotel.should_not be_valid
        end.should raise_error(ActiveRecord::RecordInvalid)
    end
    it "should not let users enter invalid website during a hotel creation" do
        lambda do
          @hotel = FactoryGirl.create(:hotel, @attr.merge(:website => 'http://send'))
          @hotel.should_not be_valid
        end.should raise_error(ActiveRecord::RecordInvalid)
    end
  end  
end
