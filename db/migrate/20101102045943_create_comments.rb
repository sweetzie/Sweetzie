class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :relation_id
      t.integer :relation_type

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
