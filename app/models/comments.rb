class Comments < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :activity
  
  validates_presence_of :user_id, :relation_id, :relation_type, :comment
  
end
