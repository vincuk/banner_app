class Click < ActiveRecord::Base
  has_one :conversion

  validates :click_id, presence: true, uniqueness: true, numericality: { only_integer: true }
  validates :banner_id, presence: true, numericality: { only_integer: true }
  validates :campaign_id, presence: true, numericality: { only_integer: true }
  
    def self.get_top_five_banners(campaign_id)
    Click
      .where("campaign_id =?", campaign_id)
      .group(["banner_id"])
      .order("COUNT(ALL) DESC")
      .count
      .take(5)
      .map(&:first)
  end
end
