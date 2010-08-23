class CreateGrabs < ActiveRecord::Migration
  def self.up
    create_table :grabs do |t|
      t.column :user_id, :integer, :null => false
      t.column :item_id, :integer, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :grabs
  end
end
