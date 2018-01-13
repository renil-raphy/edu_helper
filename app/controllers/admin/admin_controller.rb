class Admin::AdminController < ApplicationController
  layout 'admin'

  before_action :authenticate_admin_admin!

  helper_method :current_admin, :is_super_admin?

  protected

  def check_super_admin
    if !is_super_admin?
      flash[:error] = "You do not have permission. Contact Super Admin."
      redirect_to admin_dashboard_path
    end
  end

  private

  # Helper Method for current logged in member
  def current_admin
    current_admin_admin ? current_admin_admin : nil
  end

  def is_super_admin?
    current_admin.role == "super_admin" ? true : false
  end

end
