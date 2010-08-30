class GrabsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_grabbed_item
  
  def create
    current_user.grab!(@item)
    redirect_to @item
    Activity.add(current_user, Activity::NEW_GRAB, @item)
  end
  
  def destroy
  end
  
  private
  
    def get_grabbed_item
      @item = Item.find(params[:grab][:item_id])
    end
end
