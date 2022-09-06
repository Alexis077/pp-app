class Api::V1::PurchasesController < ApplicationController
  def index
    render json: Purchase.search(params)
  end
end
