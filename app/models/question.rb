class Question < ApplicationRecord

  # Associations
  belongs_to :category
  # --------------------

  # Validations
  validates :qn_text, presence: { message: "Please enter question."}
  validates :category_id, presence: { message: "Please choose category."}
  # --------------------

  def self.search(params)
    questions = all
    if params[:category]
      questions = questions.where("lower(name) like ?", "%#{params[:query].downcase}%")
    end
    questions
  end

end
