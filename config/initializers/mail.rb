# config/initializers/mail.rb
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "#{SITE_URL}",
  :authentication => :plain,
  :enable_starttls => true,
  :user_name => "kyle.l.doherty@gmail.com",
  :password =>  "valenciaCA2012"
  
}