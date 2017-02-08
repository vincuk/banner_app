require 'spec_helper'

describe CampaignsHelper do
  describe "new_user?" do
    it "returns true" do
      helper.new_user?.should == true
    end
  end
  
  describe "user_not_in_base?" do
    before { helper.create_user }
    after { User.destroy_all }
    it "false after create_user" do
      helper.user_not_in_base?.should == false
    end
  end
  
  describe "to_array" do
    before { helper.create_user }
    after { User.destroy_all }
    it "converts string to array" do
      helper.to_array("1&2&3&4&5").should == [*1..5]
    end
  end
end
