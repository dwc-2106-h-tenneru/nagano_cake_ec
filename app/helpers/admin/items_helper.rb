module Admin::ItemsHelper
  # 価格を３桁区切り
  def converting_to_jpy(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end
end
