class AddInlineTotalToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :inline_total, :float
  end
end
