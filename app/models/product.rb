class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, uniqueness: true

  def most_demanded
  end

  def top_incomes
  end
end
