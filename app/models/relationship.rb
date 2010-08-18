class Relationship < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :relation, :class_name => "User"
  
end
