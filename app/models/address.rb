class Address < ApplicationRecord
   belongs_to :customer

<<<<<<< HEAD
  def address_set
=======
  def order_address
>>>>>>> origin/develop
    self.post_code.to_s + self.address + self.name
  end
end