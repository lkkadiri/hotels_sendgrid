require 'spec_helper'
describe Room do
  describe "relations" do
    it{should belong_to(:hotel)}
  end
  describe "#create_room" do 
    let(:room) { FactoryGirl.build(:room) }
    it "#creates a room" do
      room.should_not be_nil
    end
  end  
  
end
