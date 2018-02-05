class Admin::QuestionsController < Admin::AdminController
  before_action :set_question, only: [:edit, :update]
  before_action :set_categories, except: [:index]

  def index
    @questions = Question.includes(:category).search(params).order("categories.name", "qn_text").paginate(:page => page_number, :per_page => 25)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to admin_questions_path, :flash => { :success => "Question was created." }
    else
      flash[:error] = "Question could not be created. Please try again."
      render 'new'
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to admin_questions_path, :flash => { :success => "Question was updated." }
    else
      flash[:error] = "Question could not be updated. Please try again."
      render 'edit'
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def question_params
    params.require(:question).permit(:qn_text, :category_id)
  end
end
