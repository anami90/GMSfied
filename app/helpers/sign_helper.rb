module SignHelper

  def sign_in(session)
   cookies.permanent.signed[:remember_token] = [session.id, session.salt]
   current_user = session
  end
  
  def current_user
     @current_user ||= user_from_remember_token
  end
  
  def signed_in?
     !current_user.nil?
  end  
  
  def sign_out
     cookies.delete(:remember_token)
     current_user = nil
  end 
  
  def deny_access
      store_location
      redirect_to signin_path, :notice => "Please sign in to access this page"
   end
   
   def redirect_back_or(default)
     redirect_to(session[:return_to] || default)
     clear_return_to
  end   
  
 private
   def user_from_remember_token
     Session.authenticate_with_salt(*remember_token)
   end
   def remember_token
     cookies.signed[:remember_token] || [nil, nil]
   end
   
   def current_user?(session)
     session == current_user
   end

   def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

   def store_location
      session[:return_to] = request.fullpath
   end
   def clear_return_to
      session[:return_to] = nil
   end   
        
      
 
end
