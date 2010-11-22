class CreateGrabs < ActiveRecord::Migration
  def self.up
    create_table :grabs do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :grabs
  end
end
