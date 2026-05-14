class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @order = current_user.orders.build(order_params)
    @order.total = current_cart.total_price

    if @order.save
      redirect_to order_path(@order)
    else
      render 'carts/checkout', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :billing_name, :billing_address,
      :shipping_name, :shipping_address
    )
  end
end
