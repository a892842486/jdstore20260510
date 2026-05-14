class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    @order = current_user.orders.build(order_params)
    @order.total = current_cart.total_price

    if @order.save
      # 將購物車商品備份成 ProductList 快照
      current_cart.cart_items.each do |cart_item|
        @order.product_lists.create!(
          product_name: cart_item.product.title,
          product_price: cart_item.product.price,
          quantity: cart_item.quantity
        )
      end

      redirect_to order_path(@order)
    else
      render 'carts/checkout', status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  private

  def order_params
    params.require(:order).permit(
      :billing_name, :billing_address,
      :shipping_name, :shipping_address
    )
  end
end
