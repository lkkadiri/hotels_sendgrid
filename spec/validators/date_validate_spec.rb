require 'spec_helper'
describe DateValidate do
  before(:each) do
    @attr = { 

    }
  end
  it "should not let users use same dates" do
    lambda do
      @reservation = FactoryGirl.create(:reservation, @attr.merge(:check_in => Date.today, :check_out => Date.today ))
      @reservation.should_not be_valid
    end.should raise_error(ActiveRecord::RecordInvalid)
  end
  it "should not let users use check_in dates that occur after check_oy dates" do
    lambda do
      @reservation = FactoryGirl.create(:reservation, @attr.merge(:check_in => Date.today, :check_out => Date.today - 2.days ))
      @reservation.should_not be_valid
    end.should raise_error(ActiveRecord::RecordInvalid)
  end
end