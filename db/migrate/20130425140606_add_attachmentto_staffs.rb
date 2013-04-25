class AddAttachmenttoStaffs < ActiveRecord::Migration
  def up
  	remove_column :staffs, :attachment
    add_attachment :staffs, :attachment
  end

  def down
  end
end
