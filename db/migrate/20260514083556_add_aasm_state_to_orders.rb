class AddAasmStateToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :aasm_state, :string, default: "order_placed", null: false
    add_index  :orders, :aasm_state
  end
end
