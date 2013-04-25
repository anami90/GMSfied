class AddSaltToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :salt, :string
  end
end
