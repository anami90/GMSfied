class SessionMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(session)
  	@session = session
  	@url = "http://example.com/login"
  	mail(:to => session.email, :subject => "welcome to GMS")
  end	

end
