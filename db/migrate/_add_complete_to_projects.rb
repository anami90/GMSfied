class AddCompleteToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :completed, :string
  end
end
