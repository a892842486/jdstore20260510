class WelcomeController < ApplicationController
  def index
    flash[:notice] = t("flash.welcome.greeting")
  end
end
