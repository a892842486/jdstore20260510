class Admin::OrdersController < ApplicationController
   layout "admin"
   before_action :authenticate_user!
   before_action :admin_required
   before_action :set_order, only: [:show, :ship, :shipped, :cancel, :return]

   def index
     @orders = Order.order(id: :desc)
   end

   def show
   end

   def ship
     @order.ship!
     OrderMailer.notify_ship(@order).deliver_later
     redirect_back fallback_location: admin_orders_path, notice: t("flash.admin.orders.shipped")
   end

   def shipped
     @order.deliver!
     redirect_back fallback_location: admin_orders_path
   end

   def cancel
     @order.cancel_order!
     OrderMailer.notify_cancel(@order).deliver_later
     redirect_back fallback_location: admin_orders_path, notice: t("flash.admin.orders.cancelled")
   end

   def return
     @order.return_good!
     redirect_back fallback_location: admin_orders_path
   end

   private

   def set_order
     @order = Order.find_by!(token: params[:id])
   end
end
