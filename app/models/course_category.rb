class CourseCategory < ApplicationRecord

  # Associations
  belongs_to :category
  belongs_to :course
  # ------------

  # Validations
  validates :category_id, presence: true
  validates :course_id, presence: true
  # ----------------

end
