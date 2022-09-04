class Product < ApplicationRecord
  validates :name, uniqueness: true

  has_many :product_categories
  has_many :categories, through: :product_categories

end
