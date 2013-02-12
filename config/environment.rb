# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
HotelsSendgrid::Application.initialize!
ActionMailer::Base.smtp_settings = {
  :user_name => "lkkadiri",
  :password => "password21",
  :domain => "lkadiri.com",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}