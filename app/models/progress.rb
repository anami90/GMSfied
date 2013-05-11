class Progress < ActiveRecord::Base
  attr_accessible :date, :milestone, :post, :project_id, :status, :session_id
  validates_presence_of :date, :milestone, :post, :project_id, :status, :session_id => "Cant be blank"

belongs_to :session
belongs_to :project
  
validates :post, :length => { :maximum => 300 }
validates :session_id, presence: true

validates_numericality_of :milestone, :less_than_or_equal_to => Proc.new { |r| r.project.milestones }, :allow_blank => true

default_scope order: 'Progresses.created_at DESC'
end
