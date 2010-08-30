class RelationshipsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_followed_user
  
  def create
    current_user.follow!(@user)
    redirect_to @user
    Activity.add(current_user, Activity::NEW_RELATIONSHIP, @user)
  end

  def destroy
    current_user.unfollow!(@user)
    redirect_to @user
  end
  
  private
  
    def get_followed_user
      @user = User.find(params[:relationship][:followed_id])
    end

end
