class ConvertIdToInt < ActiveRecord::Migration
  def change
    change_column(:impressions, :banner_id, :integer)
    change_column(:impressions, :campaign_id, :integer)
    change_column(:clicks, :click_id, :integer)
    change_column(:clicks, :campaign_id, :integer)
    change_column(:clicks, :banner_id, :integer)
    change_column(:conversions, :conversion_id, :integer)
    change_column(:conversions, :click_id, :integer)
  end
end
