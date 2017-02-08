class Campaign < ActiveRecord::Base
  def self.get_banners(campaign_id)
    set_of_banners = get_top_ten_revenue_banners(campaign_id)
    set_of_banners = fill_up(set_of_banners, campaign_id) if set_of_banners.size < 5
    set_of_banners
  end
  
  private
    
    def self.get_top_ten_revenue_banners(campaign_id)
      Click
        .where("campaign_id = ?", campaign_id)
        .joins("INNER JOIN conversions ON conversions.click_id = clicks.click_id")
        .group(["banner_id"])
        .order("SUM(revenue) DESC")
        .sum(:revenue)
        .take(10)
        .map(&:first).map(&:to_i)
    end
    
    def self.fill_up(set_of_banners, campaign_id)
      top_five = Click.get_top_five_banners(campaign_id)
      while set_of_banners.size < 5 do
        unless top_five.empty?
          new_banner = top_five.shift
        else
          new_banner = Impression.get_random_banner(campaign_id)
        end
        set_of_banners.push(new_banner) unless set_of_banners.include?(new_banner)
      end
      set_of_banners
    end
end
