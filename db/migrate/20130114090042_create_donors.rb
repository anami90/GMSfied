class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.text :description
      t.float :funding
      t.integer :project_id
      t.float :balance

      t.timestamps
    end
  end
end
