class OrderItems < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def total_price(order)
    oi = OrderItems.where(order_id: order.id)
    
  end

end