class Admin::DistrictsController < Admin::AdminController
  before_action :set_district, only: [:edit, :update]

  def index
    @districts = District.paginate(:page => page_number, :per_page => 25)
  end

  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)

    if @district.save
      redirect_to admin_districts_path, :flash => { :success => "District was created." }
    else
      flash[:error] = "District could not be created. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @district.update(district_params)
      redirect_to admin_districts_path, :flash => { :success => "District was updated." }
    else
      flash[:error] = "District could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_district
    @district = District.friendly.find(params[:id])
  end

  def district_params
    params.require(:district).permit(:name)
  end
end
