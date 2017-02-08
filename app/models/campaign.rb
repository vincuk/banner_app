class Campaign < ActiveRecord::Base
  def self.get_banners(campaign_id)
    [*1..7]
  end
end
