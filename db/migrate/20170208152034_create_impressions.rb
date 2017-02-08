class CreateImpressions < ActiveRecord::Migration
  def change
    create_table :impressions do |t|
      t.string :banner_id
      t.string :campaign_id

      t.timestamps
    end

    add_index :impressions, :campaign_id
  end
end
