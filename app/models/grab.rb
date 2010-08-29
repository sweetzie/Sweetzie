class Grab < ActiveRecord::Base
  
  belongs_to :item
  belongs_to :user
  
  fires :new_grab, :on => :create, :actor => :user, :secondary_subject => 'item'
  
  validates_presence_of :user_id, :item_id
  
end
