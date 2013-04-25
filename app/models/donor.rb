class Donor < ActiveRecord::Base
  attr_accessible :description, :name, :balance, :funding, :project_id
  validates_presence_of :description, :name, :balance, :funding, :project_id => "Cant be blank"
  
  
  #Relationships
  has_many :projects
  #has_many :grantees
  
  
end
