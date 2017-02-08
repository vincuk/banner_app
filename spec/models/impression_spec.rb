require 'spec_helper'

describe Impression do
  before do
    @impression = Impression.new(banner_id: 111, campaign_id: 2)
  end

  subject { @impression }

  it { should respond_to(:banner_id) }
  it { should respond_to(:campaign_id) }

  it { should be_valid }
  
  describe "when banner_id is blank" do
    before { @impression.banner_id = " " }
    it { should_not be_valid }
  end
  
  describe "when campaign_id is blank" do
    before { @impression.campaign_id = " " }
    it { should_not be_valid }
  end
  
  describe "when campaign has only one banner" do
    it "should return empty campaign" do
      expect(Impression.empty_campaign?(2)).to eq(true)
    end

    before { @impression.save }

    it "should return it as a randome one" do
      expect(Impression.get_random_banner(2)).to eq(111)
    end
  end
  
  after(:all) { Impression.destroy_all }
end
