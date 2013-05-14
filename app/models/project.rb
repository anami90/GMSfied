class Project < ActiveRecord::Base
attr_accessible :accountnumber, :amount, :balance, :budget_id, :donor_id, :finish, :grantee_id, :latitude, :ledger_id, :grantee_id, :location, :longitude, :name, :startdate, :milestones, :stage
validates_presence_of :milestones, :finish, :location, :name, :startdate, :milestones,:grantee_id, :donor_id, :stage => "Cant be blank"  

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
#validates :startdate, :greater_than_or_equal_to => Proc.new { |r| r.finish }, :allow_blank => true
validates_numericality_of :amount 
validates_numericality_of :accountnumber

validate :valid_dates

  def valid_dates
    if startdate >= finish
      self.errors.add :startdate, ' Start date has to be before finish date'
    end
  end
acts_as_xlsx

#acts_as_gmappable :process_geocoding => false

end
