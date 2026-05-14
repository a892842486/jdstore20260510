class AddNotNullToOrdersToken < ActiveRecord::Migration[8.1]
  def change
    change_column_null :orders, :token, false
  end
end
