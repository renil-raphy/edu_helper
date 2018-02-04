class Location < ApplicationRecord

  # Basic Configurations
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order(:name) }
  # --------------------

  # Associations
  belongs_to :district
  # --------------------

  # Validations
  validates :name, presence: { message: "Please enter the name"},
                   length: { minimum: 2, message: "Please enter a valid location name with min. 2 characters"},
                   uniqueness: { message: "Location is already added!" }
  validates :district_id, presence: { message: "Please select the district"}
  # --------------------

  private

  ##
  # Private method to enable changing of slug value when name changes
  def should_generate_new_friendly_id?
    name_changed?
  end

end
