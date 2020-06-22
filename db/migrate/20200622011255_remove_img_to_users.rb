class RemoveImgToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :img
    add_column :users, :perfil, :string
  end
end
