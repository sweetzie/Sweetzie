class Item < ActiveRecord::Base
  
  has_many :grabs
  has_many :users, :through => :grabs
  has_many :reviews
  
  validates_presence_of :barcode
  
  # def to_param
  #    "#{id}-#{permalink}"
  #  end
  #  
  #  def permalink
  #    name.gsub(/\s/, '-').gsub(/[^\w-]/, '').downcase
  #  end
  
end
