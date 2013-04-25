class AddMemorandumouToGrantees < ActiveRecord::Migration
  def self.up
  	remove_column :grantees, :memorandumou
    add_attachment :grantees, :memorandumou
  end

  def self.down
  end
end