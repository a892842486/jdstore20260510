class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show]

  def create
    @order = current_user.orders.build(order_params)
    @order.total = current_cart.total_price

    ActiveRecord::Base.transaction do
      if @order.save
        current_cart.cart_items.each do |cart_item|
          @order.product_lists.create!(
            product_name: cart_item.product.title,
            product_price: cart_item.product.price,
            quantity: cart_item.quantity
          )
        end

        # ✅ 清空購物車
        current_cart.clean!

        # ✅ 寄信（建議用 deliver_later）
        OrderMailer.notify_order_placed(@order).deliver_later

        # ✅ redirect（配合 to_param token）
        return redirect_to account_order_path(@order.token),
               notice: t("flash.orders.created")
      else
        raise ActiveRecord::Rollback
      end
    end

    render 'carts/checkout', status: :unprocessable_entity
  end

  def show
    @order = current_user.orders.find_by!(token: params[:id])
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
