ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "GMS.com",  
  :user_name            => "cliff.moffitt@gmail.com",  
  :password             => "zxlxkeznviookshw",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
ActionMailer::Base.default_url_options[:host] = "localhost:3000"