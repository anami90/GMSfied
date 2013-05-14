class RemoveMilestoneFromProgresses < ActiveRecord::Migration
  def up
    remove_column :progresses, :milestone
  end

  def down
    add_column :progresses, :milestone, :string
  end
end
