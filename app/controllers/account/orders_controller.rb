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

end
