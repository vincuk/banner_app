require 'spec_helper'

describe Campaign do
  describe "get_banners" do
    it "returns banners" do
      expect(Campaign.get_banners(1)).to eq([*1..7])
    end
  end
end
