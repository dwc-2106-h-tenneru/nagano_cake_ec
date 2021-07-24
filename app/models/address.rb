class Address < ApplicationRecord
   belongs_to :customer

  def address_set
    self.post_code.to_s + self.address + self.name
  end
end