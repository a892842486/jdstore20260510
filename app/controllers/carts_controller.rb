class CartsController < ApplicationController
  def index
    @cart_items = current_cart.cart_items.includes(:product)
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空購物車"
     redirect_to carts_path
  end
end
