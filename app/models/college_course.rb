class CollegeCourse < ApplicationRecord

  # Associations
  belongs_to :college
  belongs_to :course
  # ------------

  # Validations
  validates :college_id, presence: true
  validates :course_id, presence: true
  # ----------------

end
