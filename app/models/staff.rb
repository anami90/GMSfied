class Staff < ActiveRecord::Base
  attr_accessible :attachment, :description, :firstname, :lastname, :project_id, :grantee_id
  validates_presence_of :attachment, :description, :firstname, :lastname, :project_id, :grantee_id => "Can't be blank"
  
  has_attached_file :attachment
  validates_attachment :attachment, :presence => true
  #:content_type => { :content_type => "image/jpg" },
  #:size => { :in => 0..10.kilobytes }
  #relationships
  belongs_to :project
  has_one :grantee
end
