class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

   # Associations
   belongs_to :district
   # ---------------

   # Validations
   validates :name, presence: { message: 'Please enter your Name' },
                           length: { minimum: 2, too_short: 'Name has to be min. 2 characters long.' }
   validates :email, presence: { message: 'Please enter your Email Address' },
                    email: { message: "Please enter a valid Email Address" },
                    uniqueness: { message: "This email is already registered! Please Login." }
   # ---------------

end
