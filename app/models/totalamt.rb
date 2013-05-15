class Totalamt  attr_accessible :accountnumber, :amount, :balance, :budget_id, :donor_id, :finish, :grantee_id, :latitude, :ledger_id, :location, :longitude, :name, :startdate, :milestones, :stage


  def initialize(row)
    # set values from row, like
    @amount = row["amount"].to_f
  end
end