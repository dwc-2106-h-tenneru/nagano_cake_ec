class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD

  has_many :cart_items
end



=======
   has_many :addre, dependent: :destroy
end
>>>>>>> origin/develop
