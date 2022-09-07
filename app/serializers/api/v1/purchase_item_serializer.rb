module Api
  module V1
    class PurchaseItemSerializer < ActiveModel::Serializer
    attributes :id, :product, :quantity, :total
    belongs_to :product

      def product
        ProductSerializer.new(object.product)
      end
    end
  end
end