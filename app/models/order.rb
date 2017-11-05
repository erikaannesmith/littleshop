class Order < ApplicationRecord
  enum status: ["ordered", "paid", "cancelled", "shipped"]

  has_many :order_items
  has_many :items, through: :order_items
end