class Impression < ActiveRecord::Base
  validates :banner_id, presence: true, numericality: { only_integer: true }
  validates :campaign_id, presence: true, numericality: { only_integer: true }

  def self.empty_campaign?(campaign_id)
    Impression.where(campaign_id: campaign_id)
      .distinct.count(:banner_id) < 5
  end
  
  def self.get_random_banner(campaign_id)
    Impression.where(campaign_id: campaign_id)
      .sample(1).first.banner_id
  end
end
