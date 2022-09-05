class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :name, uniqueness: true

  def self.most_demanded
    most_demanded_query.as_json.group_by { _1['category_name'] }
  end
  def self.top_incomes
    top_incomes_query.as_json.group_by { _1['category_name'] }
  end


  private

  def self.most_demanded_query
    connection.execute(IO.read("db/scripts/most_demanded.sql"))
  end

  def self.top_incomes_query
    connection.execute(IO.read("db/scripts/top_incomes.sql"))
  end
end
