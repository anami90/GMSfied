class AddMilestonesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :milestones, :int
  end
end
