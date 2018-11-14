class AddRenterToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :renter, foreign_key: false
  end
end
