class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :conversion_id
      t.string :click_id
      t.decimal :revenue

      t.timestamps
    end
    
    add_index :conversions, :click_id, unique: true
  end
end
