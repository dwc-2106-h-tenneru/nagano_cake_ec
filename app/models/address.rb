class Address < ApplicationRecord
   belongs_to :customer

  def order_address
    self.post_code.to_s + self.address + self.name
  end

  validates :address,:name,:post_code, presence: true

end