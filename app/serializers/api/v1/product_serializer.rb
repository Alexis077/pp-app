module Api
  module V1
    class ProductSerializer < ActiveModel::Serializer
      attributes :id, :name, :price, :available_units
    end
  end
end
