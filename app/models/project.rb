class Project < ActiveRecord::Base
 attr_accessible :accountnumber, :amount, :balance, :budget_id, :donor_id, :finish, :grantee_id, :latitude, :ledger_id, :location, :longitude, :name, :startdate, :milestones, :stage
validates_presence_of :accountnumber,:milestones, :amount, :finish, :location, :name, :startdate, :milestones, :stage => "Cant be blank"  

geocoded_by :location   # can also be an IP address
after_validation :geocode

#relationships
belongs_to :grantee
has_many :budgets
has_many :staffs 
belongs_to :donor 
belongs_to :grantee
has_many :progresses

validates_numericality_of :amount, :greater_than_or_equal_to => Proc.new { |r| r.balance }, :allow_blank => true

acts_as_xlsx

#acts_as_gmappable :process_geocoding => false
	
	
end
