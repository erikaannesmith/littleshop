class Category < ApplicationRecord
  before_save :generate_slug
  validates_presence_of :name
  has_many :items



  def generate_slug
    self.slug = name.parameterize
  end
end
