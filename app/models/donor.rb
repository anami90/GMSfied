class Donor < ActiveRecord::Base
  attr_accessible :description, :name, :balance, :funding, :project
  validates_presence_of :description, :name, :balance, :funding, :project => "Cant be blank"
  
  
  #Relationships
  has_many :projects
  #has_many :grantees
  validates :funding, :numericality => { :greater_than_or_equal_to => 0 }

  acts_as_xlsx
  validates_numericality_of :funding, :greater_than_or_equal_to => Proc.new { |r| r.balance }, :allow_blank => true

end
