class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :page_number

  private

  def page_number
    (params[:page].present? && params[:page].to_i > 0) ? params[:page].to_i : 1
  end
end
