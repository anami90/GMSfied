class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.float :latitude
      t.float :longitude
      t.float :balance
      t.float :amount
      t.float :accountnumber
      t.integer :donor_id
      t.integer :ledger_id
      t.integer :budget_id
      t.integer :grantee_id
      t.date :startdate
      t.date :finish

      t.timestamps
    end
  end
end
