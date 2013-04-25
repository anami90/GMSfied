class User < ActiveRecord::Base
  attr_accessible :email, :username
  validates_presence_of :email, :username => "Cant be blank"
  
  #Relationships
  has_many :progresses
 
 
 email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
 validates :email, :presence => true,                
                  :format => {:with =>email_regex }
                  #:unique => { :case_sensitive => true }



                  
                  
end
