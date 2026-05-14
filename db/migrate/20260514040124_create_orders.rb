class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.timestamps
      t.integer :total, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.string :billing_name, null: false
      t.string :billing_address, null: false
      t.string :shipping_name, null: false
      t.string :shipping_address, null: false
    end
  end
end
