class Api::V1::PurchasesController < ApplicationController
  def index
    render json: Purchase.search(params)
  end

  def purchase_graph
    render json: { data: Utils::PurchaseMatrix.new(Purchase.graph(params)).print_matrix }
  end
end
