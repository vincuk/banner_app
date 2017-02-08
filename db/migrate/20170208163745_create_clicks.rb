class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|
      t.string :click_id
      t.string :banner_id
      t.string :campaign_id

      t.timestamps
    end
  end
end
