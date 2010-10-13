class RelationshipsController < ApplicationController
  
  before_filter :login_required #user must be logged in to follow another user
  before_filter :get_followed_user # grab the details for the user
  
  def create
    #--! If statement needed for if the follow works? !--#
    current_user.follow!(@user)
    redirect_to @user
    Activity.add(current_user, Activity::NEW_RELATIONSHIP, @user) # record the activity 
  end

  def destroy
    current_user.unfollow!(@user)
    redirect_to @user
  end
  
  private
  
    def get_followed_user
      @user = User.find(params[:relationship][:followed_id]) #fetch the user
    end

end
