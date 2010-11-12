class Comment < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :activity
  
  attr_accessible :comment, :user_id, :activity_id
  
  validates_presence_of :comment
  validates_presence_of :user_id
  validates_presence_of :activity_id
  
end
