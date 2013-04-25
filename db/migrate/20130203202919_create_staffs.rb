class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :firstname
      t.string :lastname
      t.integer :project_id
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
