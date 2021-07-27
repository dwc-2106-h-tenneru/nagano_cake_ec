class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum making_status: {"着手不可":0, "製作待ち":1, "製作中":2, "製作完了":3}

  # def add_tax_price
  #   (self.price * 1.1).round
  # end

end
