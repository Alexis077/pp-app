class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, uniqueness: true

  def self.most_demanded
    most_demanded = most_demanded_query.group_by { _1['category_name'] }
    most_demanded = most_demanded.to_a.map do 
      { category_name: _1[0], products: _1[1].map{ |product| product.except('category_name','row_num') } }
    end
  end

  def self.top_incomes
    top_incomes = top_incomes_query.group_by { _1['category_name'] }
    top_incomes = top_incomes.to_a.map do
      { category_name: _1[0], products: _1[1].map{ |product| product.except('category_name','row_num') } }
    end
  end

  private

  def self.most_demanded_query
    connection.execute(IO.read("db/scripts/most_demanded.sql"))
  end

  def self.top_incomes_query
    connection.execute(IO.read("db/scripts/top_incomes.sql"))
  end
end
