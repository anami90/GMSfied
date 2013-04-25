class Session < ActiveRecord::Base
  attr_accessor :password
 
  #has_secure_password
  
   attr_accessible :email, :name, :password, :password_confirmation

  validates_presence_of :email, :name => "Cant be blank"
  
  #Relationships
 has_many :progresses, dependent: :destroy
 
 validates :name, :length => { :maximum => 50 }
                 
 

 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
 validates :email, :presence => true,                
                  :format => {:with =>email_regex }
                  #:unique => { :case_sensitive => false }


 validates :password, :presence => true, 
 		      :confirmation => true,
 		      :length => { :within => 6..40 }
 		      
 
	 before_save :encrypt_password
	 
	
  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
    encrypted_password == encrypt(submitted_password)

  end
	
	
  def self.authenticate(email, submitted_password)
      session = find_by_email(email)
      return nil if session.nil?
      return session if session.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
     session = find_by_id(id)
     (session && session.salt == cookie_salt) ? session : nil
  end
	 
  private
     def encrypt_password
	self.salt = make_salt if new_record?
	self.encrypted_password = encrypt(password)
     end
     def encrypt(string)
	secure_hash("#{salt}--#{string}") 
     end
     def make_salt
     	secure_hash("#{Time.now.utc}--#{password}")
    end
    def secure_hash(string)
    	Digest::SHA2.hexdigest(string)
    end
    
  
end

			      

  

