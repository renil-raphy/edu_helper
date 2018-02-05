class App::PasswordController < App::ApplicationController
  before_action :set_user, only: [:update]

  def update
    if @user.update_with_password(user_password_params)
      sign_in @user, :bypass => true
      @password_updated = true

      flash[:success] = "Password was updated successfully."
    else
      @password_updated = false
    end

    respond_to do |format|
      format.json
    end
  end

  protected

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  private

  def set_user
    @user = current_user
  end

end
