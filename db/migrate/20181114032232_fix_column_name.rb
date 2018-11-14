class FixColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :user_id, :owner_id
  	rename_column :transactions, :user_id, :seller_id
  end
end
