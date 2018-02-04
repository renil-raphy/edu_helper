class Admin < ApplicationRecord

  # Basic Configurations
  default_scope { order(:name) }
  mount_uploader :profile_picture_url, ProfilePictureUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # --------------------

  # Validations
  validates :name, presence: { message: 'Please enter your name.' },
                   length: { minimum: 2,
                             too_short: 'Please enter a valid name with atleast 2 characters.' }

  validates :phone, numericality: { message: 'Please enter a valid Phone Number.',
                                    allow_blank: true },
                    length: { is: 10, message: 'Please enter a valid Phone Number with 10 digits.',
                              allow_blank: true }
  # --------------------

end
