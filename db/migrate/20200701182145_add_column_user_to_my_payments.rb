class AddColumnUserToMyPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :my_payments, :user, foreign_key: true
  end
end
