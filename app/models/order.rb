class Order < ApplicationRecord

  has_many :order_items
  has_many :items, through: :order_items

  def self.status_types
    ["Ordered", "Paid", "Cancelled", "Completed"]
  end

  enum status: status_types

  def change_status(new_status)
    case new_status
    when "cancel"
      update(status: "Cancelled")
    when "mark as paid"
      update(status: "Paid")
    when "mark as completed"
      update(status: "Completed")
    end
  end

  def order_quantity
    order_items.total_quantity
  end

  def self.status_count(type)
    orders = Order.where(status: type)
    orders.count
  end
end
