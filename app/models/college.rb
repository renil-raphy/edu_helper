class College < ApplicationRecord

  # Basic Configurations
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order("name asc") }
  # ------------

  # Associations
  belongs_to :university
  belongs_to :district

  has_many :college_courses
  has_many :courses, through: :college_courses
  # ------------

  # Validations
  validates :name, presence: { message: "Please enter the name"},
                   length: { minimum: 2, message: "Please enter a valid college name with min. 2 characters"}
  validates :university_id, presence: { message: "Please select the University"}
  validates :district_id, presence: { message: "Please select the District"}
  # --------------------

  private

  ##
  # Private method to enable changing of slug value when name changes
  def should_generate_new_friendly_id?
    name_changed?
  end

end
