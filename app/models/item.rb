class Item < ApplicationRecord
    validates_presence_of :title, :description, :price, :image, presence: true
end
