class RemoveCImgToCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :c_img
    add_column :categories, :avatar, :string
  end
end
