class Item < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items
  has_many :order_details
  attachment :image

  # 税込価格を計算する
  def add_tax_price
    (self.price * 1.1).round
  end

end
