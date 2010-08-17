# config/initializers/mail.rb

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  
  :address => "smtp.gmail.com",
  :port => 993,
  :domain => "#{SITE_URL}",
  :authentication => :login,
  :user_name => "kyle.l.doherty@gmail.com",
  :password =>  "valenciaCA2012"
  
}