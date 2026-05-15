module OrdersHelper
  def order_state_badge(order)
    base = "px-3 py-1 rounded-full text-xs font-semibold"

    case order.aasm_state.to_sym
    when :order_placed
      "#{base} bg-gray-100 text-gray-600"
    when :paid
      "#{base} bg-blue-100 text-blue-600"
    when :shipping
      "#{base} bg-yellow-100 text-yellow-700"
    when :shipped
      "#{base} bg-green-100 text-green-600"
    when :order_cancelled
      "#{base} bg-red-100 text-red-600"
    when :good_returned
      "#{base} bg-purple-100 text-purple-600"
    else
      "#{base} bg-gray-100"
    end
  end

  def order_state_text(order)
    t("aasm.order.#{order.aasm_state}")
  end
end
