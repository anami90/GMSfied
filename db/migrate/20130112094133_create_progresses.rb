class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.integer :project_id
      t.string :milestone
      t.string :post
      t.string :status
      t.string :post
      t.timestamp :date
      t.integer :session_id

      t.timestamps
    end
  end
end
