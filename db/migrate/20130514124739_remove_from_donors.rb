class RemoveFromDonors < ActiveRecord::Migration
  def up
  	remove_column :donors, :project_id
  end

  def down
  	add_column :donors, :project, :string
  end
end
