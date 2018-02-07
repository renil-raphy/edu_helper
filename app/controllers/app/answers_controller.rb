class App::AnswersController < App::ApplicationController
  before_action :set_new_question, only: [:new]
  before_action :set_user_categories, only: [:new]
  before_action :set_current_question, only: [:create]

  def new
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @answer.question = @question
    @answer.category = @question.category

    if @answer.save
      redirect_to new_app_answer_path
    else
      flash[:error] = "Your answer could not be saved. Please try again."
      render 'new'
    end
  end

  private

  def set_new_question
    random_qn_id = (Question.ids - current_user.answers.pluck(:question_id)).sample
    @question = random_qn_id.present? ? Question.find(random_qn_id) : nil
  end

  def set_user_categories
    if @question.blank?

    end
  end

  def set_current_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:weightage)
  end

end
