require 'spec_helper'
describe User do
  describe "relations" do
    it{should have_many(:reservation)}
  end
end