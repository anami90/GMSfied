class Grantee < ActiveRecord::Base
  attr_accessible :date, :description, :email, :firstname, :lastname, :memorandumou, :organization, :project_id
  validates_presence_of :date, :description, :email, :firstname, :lastname, :memorandumou, :organization =>   "Cant be blank"

  has_attached_file :memorandumou
  validates_attachment_content_type :memorandumou, :content_type =>['application/pdf']

  #Relationships
  has_many :projects
  has_one :donor
  has_many :staffs

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,                
                  :format => {:with =>email_regex }
end
