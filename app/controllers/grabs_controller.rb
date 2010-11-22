class GrabsController < ApplicationController
  
  before_filter :get_item

  def create
    @grab = Grab.new(params[:grab])
    
    if @grab.save
      Activity.add(current_user, Activity::NEW_GRAB, @grab) # record the activity for the feed
      flash[:notice] = "Thanks for sharing!" #let them know it happened.
      redirect_to :back #send them back
    else
      flash[:notice] = "Something went wrong. Try again in a minute." #flash an error message
      redirect_to :back # send them back
    end
  end
  
  private
  
    def get_item
      @item = Item.find(params[:grab][:item_id]) # find the activity
    end

end
