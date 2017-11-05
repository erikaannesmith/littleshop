class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def self.total_price_of_order(order)
    where(order_id: order.id).sum(:inline_total)
  end

end
