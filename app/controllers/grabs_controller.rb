class GrabsController < ApplicationController
  
  # The grabs controller handles recording of item grabs by users.
  
  # Require a user to be logged in.
  before_filter :login_required
  # Find the item's details before running the actions
  before_filter :get_grabbed_item
  
  def create
    @comment = params[:comment]
    #--! Does this need an if statement? !--#
    current_user.grab!(@item, @comment) # grab the item
    redirect_to @item #redirect to item
      flash[:notice] = "Successfully grabbed #{@item.name}"
      Activity.add(current_user, Activity::NEW_GRAB, @item) # record the activity for the feed
  end
  
  private
  
    def get_grabbed_item
      @item = Item.find(params[:grab][:item_id]) # find the item
    end
end
