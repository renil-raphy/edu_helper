class Admin::AdminsController < Admin::AdminController
  layout :resolve_layout
  before_action :check_super_admin

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    @admin.role = (Admin.count > 0) ? 'admin' : 'super_admin'

    if @admin.save
      redirect_to admin_admins_path, :flash => { :success => "Admin was created." }
    else
      flash[:error] = "Admin could not be created. Please try again."
      render 'new'
    end

  end

  def destroy
    if Admin.count > 1
      Admin.find(params[:id]).destroy
      flash[:success] = "Admin has been deleted."
    else
      flash[:error] = "Can not delete the last Admin."
    end

    redirect_to admin_admins_path
  end

  private

  def resolve_layout
    case action_name
    when "sign_in", "create_session"
      "admin_fullpage"
    else
      "admin"
    end
  end

  def admin_params
    params.require(:admin).permit(:name, :email, :password, :phone)
  end

end
