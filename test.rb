require 'rubygems'
require 'mail'

# smtp = { :address => 'mail.fiendz.org', :port => 587, :domain => 'fiendz.org', :user_name => 'test@fiendz.org', :password => 'foobar', :enable_starttls_auto => true, :openssl_verify_mode => 'none' }
# Mail.defaults { delivery_method :smtp, smtp }
# mail = Mail.new do
#   from 'test@fiendz.org'
#   to 'donald.ball@gmail.com'
#   subject 'subject'
#   body 'body'
# end

# mail.deliver!


mail = Mail.new do
  from    'jamesbook@umblepie.com'
  to      'romanchukenator@gmail.com'
  subject 'This is a test email'
  body    'Hope this all works!'
end

mail.to_s


Pony.mail(:to => 'romanchukenator@gmail.com', :from => 'j.romanchuk@umblepie.com', :subject => 'hi', :body => 'Hello there.')