class Admin::UniversitiesController < Admin::AdminController
  before_action :set_university, only: [:edit, :update]

  def index
    @universities = University.paginate(:page => page_number, :per_page => 25)
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(university_params)

    if @university.save
      redirect_to admin_universities_path, :flash => { :success => "University was created." }
    else
      flash[:error] = "University could not be created. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @university.update(university_params)
      redirect_to admin_universities_path, :flash => { :success => "University was updated." }
    else
      flash[:error] = "University could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_university
    @university = University.friendly.find(params[:id])
  end

  def university_params
    params.require(:university).permit(:name, :website, :phone, :address)
  end

end
