class AddBarcodeToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :barcode, :string
  end

  def self.down
    remove_column :items, :barcode
  end
end
