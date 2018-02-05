class App::UsersController < App::ApplicationController
  before_action :set_user
  before_action :set_districts

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to app_settings_profile_path, :flash => { :success => "Profile was updated." }
    else
      flash[:error] = "Profile could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_districts
    @districts = District.all
  end

  def user_params
    params.require(:user).permit(:name, :gender, :date_of_birth, :district_id)
  end

end
