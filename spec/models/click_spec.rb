require 'spec_helper'

describe Click do
  before do
    @click = Click.new(click_id: 10001, banner_id: 111, campaign_id: 1)
  end

  subject { @click }

  it { should respond_to(:click_id) }
  it { should respond_to(:banner_id) }
  it { should respond_to(:campaign_id) }

  it { should be_valid }

  describe "when click_id is blank" do
    before { @click.click_id = " " }
    it { should_not be_valid }
  end
  
  describe "when banner_id is blank" do
    before { @click.banner_id = " " }
    it { should_not be_valid }
  end
  
  describe "when campaign_id is blank" do
    before { @click.campaign_id = " " }
    it { should_not be_valid }
  end
  
  describe "when click_id is already taken" do
    before do
      click_with_same_id = @click.dup
      click_with_same_id.save
    end

    it { should_not be_valid }
  end
  
  describe "should return" do
    before do
      generate_top_five_banners
    end
    
    it "top 5 banners based on clicks" do
      expect(Click.get_top_five_banners(1)).to eq([*101..105].reverse)
    end
  end
  
  after(:all) { Click.destroy_all }
end

def generate_top_five_banners
  for bn_id in 1..5 do
    cl_id = 1
    while cl_id <= bn_id do
      Click.create!(click_id: 1000 + 10*bn_id + cl_id, 
        banner_id: 100 + bn_id, campaign_id: 1)
      cl_id += 1
    end
  end
end
