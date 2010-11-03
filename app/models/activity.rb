class Activity < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :target, :polymorphic => true
  
  default_scope :order => 'activities.created_at DESC'
  
  NEW_GRAB                = 1 # A user grabs an item
  NEW_RELATIONSHIP        = 2 # A user follows another user
  NEW_COMMENT             = 3 # A user makes a comment
  JOINED_SITE             = 4 # A user joins the site
  NEW_ITEM                = 5 # A user creates a new item.
  NEW_REVIEW              = 6 # A user reviews an item.
  
  def self.add(user, activity_type, target)
    return false if user.blank? or activity_type.blank? or target.blank?
    activity = Activity.new(:user => user, :activity_type => activity_type, :target => target)
    activity.save!
  end  
end