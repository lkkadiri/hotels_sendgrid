require 'spec_helper'
describe Reservation do  
  describe "relations" do
    it{should belong_to(:room)}
    it{should belong_to(:user)}
  end
  
  describe "is_reserved?" do
    it "should return false" do 

    end
  end

end