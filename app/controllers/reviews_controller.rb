class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params[:review])
    if @review.save
      Activity.add(current_user, Activity::NEW_REVIEW, @review) # record the activity for the feed
      flash[:notice] = "Thanks for your review!"
      redirect_to session[:return_to]
    else
      flash[:notice] = "There was a problem. Please try again."
      redirect_to session[:return_to]
    end
  end

end
