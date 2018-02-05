class App::ApplicationController < ApplicationController
  layout 'app'

  before_action :authenticate_app_user!

  helper_method :current_user

  private

  # Helper Method for current logged in User
  def current_user
    current_app_user ? current_app_user : nil
  end

end
