class Admin::LocationsController < Admin::AdminController
  before_action :set_location, only: [:edit, :update]
  before_action :set_districts, except: [:index]

  def index
    @locations = Location.includes(:district).paginate(:page => page_number, :per_page => 25)
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to admin_locations_path, :flash => { :success => "Location was created." }
    else
      flash[:error] = "Location could not be created. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to admin_locations_path, :flash => { :success => "Location was updated." }
    else
      flash[:error] = "Location could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_location
    @location = Location.friendly.find(params[:id])
  end

  def set_districts
    @districts = District.all
  end

  def location_params
    params.require(:location).permit(:name, :district_id)
  end
end
