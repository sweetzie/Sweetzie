class CommentsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_activity
  
  
  def new 
    
  end 
  
  def create
    current_user.comment!(@activity)
    redirect_back_or_default('/')
      flash[:notice] = "Comment saved!"
  end

  private
  
    def get_activity
      @activity = Activity.find(params[:comment][:activity_id]) # find the activity
    end

end
