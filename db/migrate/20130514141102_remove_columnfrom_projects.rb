class RemoveColumnfromProjects < ActiveRecord::Migration
  def up
  	remove_column :projects, :amount
  end

  def down
  	add_column :projects, :amount, :decimal
  end
end
