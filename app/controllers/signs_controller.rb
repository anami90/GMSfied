class SignsController < ApplicationController
  layout 'login'
def new
     
      @title = "Sign in"

	
  end
  
  def create
      session = Session.authenticate(params[:sign][:email], params[:sign][:password])
       if session.nil?
     flash.now[:error] = "Invalid email/password combination."
     
     @title = "Sign in"
     
     render 'new'
     
     else
       sign_in session
       redirect_back_or session

     end

     
  end
  
  def destroy
    sign_out
    redirect_to signin_path
  end
end
