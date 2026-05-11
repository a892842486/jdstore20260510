class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def destroy
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    flash[:warning] = "成功將 #{@product.title} 從購物車刪除！"
    redirect_back fallback_location: carts_path
  end

  def update
    @cart = current_cart
    @cart_item = @cart.cart_items.find(params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "成功變更數量"
    else
      flash[:warning] = "庫存不足"
    end
    @cart_item.update(cart_item_params)
    redirect_to carts_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
