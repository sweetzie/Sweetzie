class InvitationsController < ApplicationController
  
  def new
    @invitation = Invitation.new
  end
  
  def create
    @invitation = Invitation.new(params[:invitation])
    @invitation.sender = current_user
    if @invitation.save
      if logged_in?
        Mailer.deliver_invitation(@invitation, signup_url(@invitation.token), current_user) 
        flash[:notice] = "Your invitation was sent to #{@invitation.recipient_email}. Way to spread the love."
        redirect_to root_url
      else
        flash[:notice] = "Thanks for your interest. See you soon."
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end
  
end
