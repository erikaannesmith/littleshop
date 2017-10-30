class Item < ApplicationRecord
    validates_presence_of :title, :description, :price, presence: true
end
