class Review < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :item
  
  default_scope :order => 'reviews.created_at DESC'
  
end
