class Item < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :price, presence: true

  belongs_to :category

  enum status: ["Active", "Retired"]

  has_many :order_items
  has_many :orders, through: :order_items

  def retired?
    status == "Retired"
  end
end
