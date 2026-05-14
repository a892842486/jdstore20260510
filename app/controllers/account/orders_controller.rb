class Account::OrdersController < ApplicationController
  before_action :authenticate_user!

  # 顯示使用者的歷史訂單，依最新到最舊排序
  def index
    @orders = current_user.orders.order(id: :desc)
  end

  # 顯示單一訂單細節
  def show
    @order = current_user.orders.find_by!(token: params[:id])
  end

  def pay_with_creditcard
    process_payment("creditcard", "使用信用卡完成付款")
  end

  def pay_with_ewallet
    process_payment("ewallet", "使用電子錢包完成付款")
  end

  private

  def process_payment(method, message)
    @order = current_user.orders.find_by!(token: params[:id])

    if @order.is_paid?
      redirect_to account_order_path(@order), alert: "此訂單已付款"
      return
    end

    @order.set_payment_with!(method)
    @order.make_payment!

    redirect_to account_order_path(@order), notice: message
  end

end
