class Category < ApplicationRecord

  # Basic Configurations
  extend FriendlyId
  friendly_id :name, use: :slugged
  default_scope { order("name asc") }
  # ------------

  # Associations
  has_many :questions
  has_many :answers
  has_many :user_categories
  # ------------

  # Validations
  validates :name, presence: { message: "Please enter a Category Name."},
                    length: { minimum: 2,
                              message: "Please enter a valid Category Name with min. 2 characters."}

  # Private Methods
  private

  def self.search(params)
    categories = all # for not existing params args
    categories = categories.where("lower(name) like ?", "%#{params[:query].downcase}%") if params[:query]
    categories
  end

  def should_generate_new_friendly_id?
    name_changed?
  end

end
