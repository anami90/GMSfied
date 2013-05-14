class AddColumnAmountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :amount, :decimal
  end
end
