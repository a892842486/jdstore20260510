class CreateProductLists < ActiveRecord::Migration[8.1]
  def change
    create_table :product_lists do |t|
      t.references :order, null: false, foreign_key: true
      t.string  :product_name, null: false
      t.integer :product_price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
