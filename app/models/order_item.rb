class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def self.total_price_of_order(order)
    where(order_id: order.id).sum(:inline_total)
  end

  def self.find_quantity(item, order)
    find_by(item: item, order: order).quantity
  end

  def self.find_subtotal(item, order)
    find_by(item: item, order: order).inline_total
  end

  def self.total_quantity
    sum(:quantity)
  end
end
