class Admin < ApplicationRecord
  default_scope { order(:name) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_picture_url, ProfilePictureUploader

  # Validations
  validates :name, presence: { message: 'Please enter your Name.' },
                   length: { minimum: 2,
                             too_short: 'Please enter a valid Name with atleast 2 characters.' }

  validates :phone, numericality: { message: 'Please enter a valid Phone Number.',
                                    allow_blank: true },
                    length: { is: 10, message: 'Please enter a valid Phone Number with 10 digits.',
                              allow_blank: true }

end
