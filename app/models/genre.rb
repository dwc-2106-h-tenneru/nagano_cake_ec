class Genre < ApplicationRecord
  has_many :items
<<<<<<< HEAD
  
  validates :name, presence: true
  
=======
validates :name, presence: true
>>>>>>> origin/develop
end
