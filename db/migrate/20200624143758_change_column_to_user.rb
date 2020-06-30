class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :permission_level
    add_column :users, :permission_level, :integer , default: 0
  end
end
