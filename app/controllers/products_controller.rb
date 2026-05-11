class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    cart_item = current_cart.cart_items.find_by(product: @product)

    if cart_item
      cart_item.increment!(:quantity)
      flash[:notice] = "已增加 #{@product.title} 的數量"
    else
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "已加入 #{@product.title} 到購物車"
    end

    redirect_back fallback_location: products_path
  end
end
