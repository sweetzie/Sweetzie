class Item < ActiveRecord::Base
  
  has_many :grabs
  has_many :users, :through => :grabs
  
end
