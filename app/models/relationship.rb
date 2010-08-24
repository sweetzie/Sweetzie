class Relationship < ActiveRecord::Base
  
  attr_accessible :followed_id
  
  # Associations
  
  belongs_to :follower, :foreign_key => "follower_id", :class_name => "User"
  belongs_to :followed, :foreign_key => "followed_id", :class_name => "User"
  
  # Validations
  
  validates_presence_of :follower_id, :followed_id
end
