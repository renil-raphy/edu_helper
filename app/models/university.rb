class University < ApplicationRecord

  # Basic Configurations
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order(:name) }
  # --------------------

  # Validations
  validates :name, presence: { message: "Please enter the name"},
                   length: { minimum: 2, message: "Please enter a valid university name with min. 2 characters"},
                   uniqueness: { message: "University is already added!" }

  validates :website, url: { message: "Please enter a valid website", allow_blank: true }
  validates :address, presence: { message: "Please enter the address"}
  # --------------------

  private

  ##
  # Private method to enable changing of slug value when name changes
  def should_generate_new_friendly_id?
    name_changed?
  end

end
