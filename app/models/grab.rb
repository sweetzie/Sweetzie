class Grab < ActiveRecord::Base
  
  validates_presence_of :user_id
  validates_presence_of :item_id
  
  belongs_to :user
  belongs_to :item
  
end
