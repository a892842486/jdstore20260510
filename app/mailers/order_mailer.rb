def apply_cancel(order)
  setup_order(order)

  mail(
    to: "jdstore@gmail.com",
    subject: "[JDStore] 用戶 #{@user.email} 申請取消訂單 #{@order.token}"
  )
end

private

def setup_order(order)
  @order = order
  @user  = order.user
  @product_lists = order.product_lists
end
