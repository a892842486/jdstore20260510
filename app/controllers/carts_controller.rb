class CartsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items.includes(:product)
  end

  def clean
    current_cart.clean!
    flash[:warning] = t("flash.carts.cleared")
     redirect_to carts_path
  end

  def checkout
    @order = Order.new
  end
end
