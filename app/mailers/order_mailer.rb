class OrderMailer < ApplicationMailer
  def apply_cancel(order)
    setup_order(order)

    mail(
      to: "jdstore@gmail.com",
      subject: "[JDStore] 用戶 #{@user.email} 申請取消訂單 #{@order.token}"
    )
  end

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(
      to: @user.email,
      subject: "[JDstore] 訂單成立通知 - #{order.token}"
    )
  end

  private

  def setup_order(order)
    @order = order
    @user  = order.user
    @product_lists = order.product_lists
  end
end
