class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
   has_many :address, dependent: :destroy
=======
   has_many :addre, dependent: :destroy
>>>>>>> origin/develop
end