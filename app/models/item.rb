class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  
  # 税込価格を計算する
  def add_tax_price
    (self.price * 1.1).round
  end
  
end
