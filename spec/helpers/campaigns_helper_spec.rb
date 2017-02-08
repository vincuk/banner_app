require 'spec_helper'

describe CampaignsHelper do
  describe "new_user?" do
    it "returns true" do
      helper.new_user?.should == true
    end
  end
end
