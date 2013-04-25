class AddAdminToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :admin, :boolean, default: false
  end
end
