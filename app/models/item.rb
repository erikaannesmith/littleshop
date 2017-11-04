class Item < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :price, presence: true

  belongs_to :category

  enum status: ["Active", "Retired"]

  def retired?
    status == "Retired"
  end
end
