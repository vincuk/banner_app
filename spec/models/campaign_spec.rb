require 'spec_helper'

describe Campaign do
  describe "get_banners returns top 10 banners" do
    before do
      generate_top_ten_banners
    end
    
    it "based on fixed revenue" do
      expect(Campaign.get_banners(1)).to eq([*102..111].reverse)
    end
  end
  
  describe "get_banners returns top 10 banners" do
    before do
      generate_top_ten_banners
      Conversion.find_by(conversion_id: 10011).update_attribute(:revenue, 100.1)
    end
    
    it "based on revenue" do
      expect(Campaign.get_banners(1)).to eq([*103..111].push(101).reverse)
    end
  end
  
  describe "get_banners returns top 7 banners" do
    before do
      generate_top_seven_banners
    end
    
    it "based on revenue" do
      expect(Campaign.get_banners(1)).to eq([*101..107].reverse)
    end
  end
  
  describe "get_banners returns top 5 banners" do
    before do
      generate_top_five_banners
    end
    
    it "based on clicks only" do
      expect(Campaign.get_banners(1)).to eq(Click.get_top_five_banners(1))
    end
  end
  
  describe "get_banners returns top 5 banners " do
    before do
      generate_top_five_banners
      Conversion.create!(conversion_id: 10011, click_id: 1011, revenue: 100.1)
      Conversion.create!(conversion_id: 10021, click_id: 1021, revenue: 200.1)
    end
    
    it "based on revenue and clicks" do
      expect(Campaign.get_banners(1)).to eq([*103..105].push(101).push(102).reverse)
    end
  end
  
  
  describe "get_banners returns" do
    before do
      Click.create!(click_id: 1011, banner_id: 100, campaign_id: 1)
      generate_impressions
    end
    
    it "1 banner based on clicks and 4 random banners" do
      expect(Campaign.get_banners(1).size).to eq(5)
      expect(Campaign.get_banners(1).uniq.size).to eq(5)
      expect(Campaign.get_banners(1).first).to eq(100)
    end
  end
  
  after(:all) { Click.destroy_all }
  after(:all) { Conversion.destroy_all }
  after(:all) { Impression.destroy_all }

end

def generate_top_ten_banners
  for bn_id in 1..11 do
    cl_id = 1
    while cl_id <= bn_id do
      Click.create!(click_id: 1000 + 10*bn_id + cl_id, 
        banner_id: 100 + bn_id, campaign_id: 1)
      Conversion.create!(conversion_id: 10000 + 10*bn_id + cl_id, 
        click_id: 1000 + 10*bn_id + cl_id, revenue: 0.1)
      cl_id += 1
    end
  end
end

def generate_top_seven_banners
  for bn_id in 1..11 do
    cl_id = 1
    while cl_id <= bn_id do
      Click.create!(click_id: 1000 + 10*bn_id + cl_id, 
        banner_id: 100 + bn_id, campaign_id: 1)
      Conversion.create!(conversion_id: 10000 + 10*bn_id + cl_id, 
        click_id: 1000 + 10*bn_id + cl_id, revenue: 0.1) unless bn_id > 7
      cl_id += 1
    end
  end
end

def generate_top_five_banners
  for bn_id in 1..11 do
    cl_id = 1
    while cl_id <= bn_id do
      Click.create!(click_id: 1000 + 10*bn_id + cl_id, 
        banner_id: 100 + bn_id, campaign_id: 1)
      cl_id += 1
    end
  end
end

def generate_impressions
  for bn_id in 1..11 do
    Impression.create!(banner_id: 100 + bn_id, campaign_id: 1)
  end
end
