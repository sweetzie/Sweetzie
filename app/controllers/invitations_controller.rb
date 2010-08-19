class InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save 
      flash[:notice] = "Thank you, invitation sent."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
end
