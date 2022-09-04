class PurchaseSerializer < ActiveModel::Serializer
  attributes :id, :total_products, :total_amount, :date

end
