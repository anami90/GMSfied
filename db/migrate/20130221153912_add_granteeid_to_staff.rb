class AddGranteeidToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :grantee_id, :integer
  end
end
