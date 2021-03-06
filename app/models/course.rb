class Course < ApplicationRecord

  # Basic Configurations
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order("name asc") }
  # ------------

  # Associations
  has_many :college_courses
  has_many :colleges, through: :college_courses

  has_many :course_categories
  has_many :categories, through: :course_categories
  # ------------

  # Validations
  validates :name, presence: { message: "Please enter the name"},
                   length: { minimum: 2, message: "Please enter a valid course name with min. 2 characters"},
                   uniqueness: { message: "Course is already added!" }
  # --------------------

  private

  ##
  # Private method to enable changing of slug value when name changes
  def should_generate_new_friendly_id?
    name_changed?
  end

end
