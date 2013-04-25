class CreateGrantees < ActiveRecord::Migration
  def change
    create_table :grantees do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :memorandumou
      t.string :organization
      t.text :description
      t.integer :project_id
      t.timestamp :date

      t.timestamps
    end
  end
end
