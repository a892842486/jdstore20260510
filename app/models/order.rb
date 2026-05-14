class Order < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  has_secure_token

  validates :billing_name, :billing_address,
            :shipping_name, :shipping_address,
            presence: true

  def to_param
    token
  end
end
