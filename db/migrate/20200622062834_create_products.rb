class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :p_name
      t.text :p_description
      t.float :p_price
      t.integer :p_quantify
      t.float :p_send
      t.boolean :p_avaliable
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
