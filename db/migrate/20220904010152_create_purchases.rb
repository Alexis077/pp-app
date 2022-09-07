class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :total_products
      t.integer :total_amount
      t.datetime :date

      t.timestamps
    end
  end
end
