class UserCategory < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :category
  # ------------

  # Validations
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :total_weightage, presence: true
  # ----------------

end
