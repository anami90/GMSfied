class AddPasswordToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :encrypted_password, :string
  end
end
