require 'spec_helper'
describe Room do
  describe "relations" do
    it{should belong_to(:hotel)}
  end
end
