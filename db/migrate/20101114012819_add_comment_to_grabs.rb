class AddCommentToGrabs < ActiveRecord::Migration
  def self.up
    add_column :grabs, :comment, :string
  end

  def self.down
    remove_column :grabs, :comment
  end
end
