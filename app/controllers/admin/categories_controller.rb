class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.search(params).paginate(:page => page_number, :per_page => 25)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, :flash => { :success => "Category was created." }
    else
      flash[:error] = "Category could not be created. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, :flash => { :success => "Category was updated." }
    else
      flash[:error] = "Category could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
