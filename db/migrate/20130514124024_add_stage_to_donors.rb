class AddStageToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :project, :string
  end
end
