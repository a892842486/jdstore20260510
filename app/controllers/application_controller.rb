class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_cart
  before_action :set_locale

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def admin_required
    unless current_user&.admin?
      redirect_to root_path, alert: t("flash.auth.not_authorized")
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

  private

  def set_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].to_sym)
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale]&.to_sym || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
