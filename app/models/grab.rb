class Grab < ActiveRecord::Base
  
  belongs_to :item, :class_name => "User"
  belongs_to :user, :class_name => "User"
  
  validates_presence_of :user_id, :item_id
  
end
