class Mailer < ActionMailer::Base
  
  def invitation(invitation, signup_url, current_user)
    subject    'You\'ve been invited to Sweetzie'
    recipients invitation.recipient_email
    from       'Sweetzie Invites'    
    body       :invitation => invitation, :signup_url => signup_url, :sender => current_user
    invitation.update_attribute(:sent_at, Time.now)
  end

end
