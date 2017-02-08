class Impression < ActiveRecord::Base
  validates :banner_id, presence: true, numericality: { only_integer: true }
  validates :campaign_id, presence: true, numericality: { only_integer: true }

  def self.empty_campaign?(campaign_id)
    Impression.where(campaign_id: campaign_id)
      .count < 5
  end
end
