class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order
<<<<<<< HEAD
  enum status: {"着手不可":0, "制作待ち":1, "製作中":2, "制作完了":3}
=======

  enum making_status: {"着手不可":0, "制作待ち":1, "製作中":2, "制作完了":3}
>>>>>>> origin/develop

end
