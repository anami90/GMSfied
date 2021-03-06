class Budget < ActiveRecord::Base

  attr_accessible :amount, :description, :project_id, :receiptno, :status, :task
  validates_presence_of :amount, :description, :project_id, :receiptno, :status, :task  => "Cant Be Blank"

  acts_as_xlsx


  #relationships
  belongs_to :project

  def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

end

