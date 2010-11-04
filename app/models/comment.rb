class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :activity
  
  attr_accessible :comment, :user_id, :activity_id
  
end
