class Item < ApplicationRecord

  mount_uploader :image, ImageUploader

  validates_presence_of :title, :description, :price, presence: true

end
