class AddMilestoneColumnToProgresses < ActiveRecord::Migration
  def change
    add_column :progresses, :milestone, :integer
  end
end
