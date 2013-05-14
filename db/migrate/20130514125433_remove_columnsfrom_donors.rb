class RemoveColumnsfromDonors < ActiveRecord::Migration
 def up
  	remove_column :donors, :project_id
  	remove_column :donors, :project
  end

  def down
  	add_column :donors, :project, :string
  end
end