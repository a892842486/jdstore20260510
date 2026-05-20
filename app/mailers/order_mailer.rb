class OrderMailer < ApplicationMailer
  def apply_cancel(order)
    setup_order(order)

    mail(
      to: "jdstore@gmail.com",
      subject: t("order_mailer.subject.apply_cancel", email: @user.email, token: @order.token)
    )
  end

  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = order.product_lists

    mail(
      to: @user.email,
      subject: t("order_mailer.subject.order_placed", token: @order.token)
    )
  end

  def notify_ship(order)
    setup_order(order)

    mail(
      to: @user.email,
      subject: t("order_mailer.subject.shipped", token: @order.token)
    )
  end

  def notify_cancel(order)
    setup_order(order)

    mail(
      to: @user.email,
      subject: t("order_mailer.subject.cancelled", token: @order.token)
    )
  end

  private

  def setup_order(order)
    @order = order
    @user  = order.user
    @product_lists = order.product_lists
  end
end
