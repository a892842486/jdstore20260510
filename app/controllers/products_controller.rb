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
      flash[:notice] = t("flash.products.quantity_increased", product: @product.title)
    else
      current_cart.add_product_to_cart(@product)
      flash[:notice] = t("flash.products.added_to_cart", product: @product.title)
    end

    redirect_back fallback_location: products_path
  end
end
