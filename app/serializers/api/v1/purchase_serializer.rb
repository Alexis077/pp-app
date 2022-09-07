module Api
  module V1
    class PurchaseSerializer < ActiveModel::Serializer
      attributes :id, :total_products, :total_amount, :date
      has_many :purchase_items

      def date
        object.date.strftime('%d/%m/%Y')
      end
    end
  end
end
