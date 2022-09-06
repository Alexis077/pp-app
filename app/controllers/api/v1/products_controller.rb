class Api::V1::ProductsController < ApplicationController
  def most_demanded
    render json: Product.most_demanded
  end

  def top_incomes
    render json: Product.top_incomes
  end
end
