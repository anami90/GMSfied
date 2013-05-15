class SessionMailer < ActionMailer::Base
  default from: "cliff.moffitt@gmail.com"

  def registration_confirmation(session)
  	@session = session
  	@url = "http://localhost:3000/signin"
  	mail(:to => "#{session.name} <#{session.email}>", :subject => "welcome to GMS")
  end	

end
