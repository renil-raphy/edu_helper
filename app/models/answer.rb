class Answer < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :question
  belongs_to :category
  # ------------

  # Validations
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :category_id, presence: true
  validates :weightage, presence: true
  # ----------------

end
