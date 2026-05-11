class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def add_product_to_cart(product)
    item = cart_items.find_or_initialize_by(product: product)
    item.quantity += 1
    item.save
  end

  def total_price
    cart_items.sum { |ci| ci.product.price.to_i * ci.quantity }
  end

  def clean!
    cart_items.destroy_all
  end
end
