class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
   has_many :addre, dependent: :destroy

=======
   has_many :addresses, dependent: :destroy
>>>>>>> origin/develop
end
=======
=======
>>>>>>> origin/develop

  has_many :addresses, dependent: :destroy
  has_many :cart_items
  has_many :orders
end
