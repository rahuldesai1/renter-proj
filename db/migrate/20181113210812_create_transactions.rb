class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.date :duration
      t.boolean :status

      t.timestamps
    end
  end
end
