Pony.mail(
  :to => message[:to],
  :from => @account[:from],
  :subject => message[:subject],
  :headers => { 'Content-Type' => 'text/html' },
  :body => "<h1>hey there!</h1>",
  :via => :smtp,
  :smtp => {
    :host => MY_HOST,
    :port => PORT,
    :auth => AUTH,
    :user => MY_USER,
    :password => MY_PASSWORD,
    :tls => true } )

Dawid Spamer <>

Pony.mail({
  :subject => 'Chuffed',
  :html_body => "Guess who's emailing you from tux?",
  :to => 'dawidspamer@gmail.com, j.romanchuk@umblepie.com',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'romanchukenator@gmail.com',
    :password             => 'r0m@nchuk!',
    :authentication       => :plain, 
    :domain               => "localhost.localdomain" 
  }
})


  :html_subject => 'You're a terrible, terrible person.', 

:body => 'Die of AIDs!',


# :plain, :login, :cram_md5, no auth by default
# the HELO domain provided by the client to the server