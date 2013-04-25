class Progress < ActiveRecord::Base
  attr_accessible :date, :milestone, :post, :project_id, :status, :session_id
  validates_presence_of :date, :milestone, :post, :project_id, :status, :session_id => "Cant be blank"

belongs_to :session
  
validates :post, :length => { :maximum => 200 }

default_scope order: 'Progresses.created_at DESC'
end
