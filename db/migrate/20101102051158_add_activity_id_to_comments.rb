class AddActivityIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :activity_id, :integer
    remove_column :comments, :relation_id
    remove_column :comments, :relation_type
  end

  def self.down
    remove_column :comments, :activity_id
    add_column :comments, :relation_id
    add_column :comments, :relation_type
  end
end
