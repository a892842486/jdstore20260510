class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def admin_required
    unless current_user&.admin?
      redirect_to root_path, alert: "You are not authorized."
    end
  end

  def current_cart
    @current_cart ||= begin
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end
end
