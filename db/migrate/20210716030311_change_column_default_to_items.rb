class ChangeColumnDefaultToItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :items, :is_active, from: nil, to: true
  end
end
