class CommentsController < ApplicationController
  
  before_filter :login_required
  before_filter :get_activity
  
  def create
    @comment = params[:comment]
    current_user.comment!(@activity, @comment)
    redirect_to :back
      flash[:notice] = "Comment saved!"
  end

  private
  
    def get_activity
      @activity = Activity.find(params[:comment][:activity_id]) # find the activity
    end

end
