class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.references :user, foreign_key: true
      t.boolean :available
      t.float :price

      t.timestamps
    end
  end
end
