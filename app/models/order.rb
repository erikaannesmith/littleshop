class Order < ApplicationRecord

  has_many :order_items
  has_many :items, through: :order_items

  def self.status_types
    ["Ordered", "Paid", "Cancelled", "Completed"]
  end

  enum status: status_types
end
