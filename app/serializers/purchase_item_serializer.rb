class PurchaseItemSerializer < ActiveModel::Serializer
  attributes :id, :product, :quantity, :total

  def total
    object.total.round(2)
  end

  def product
    object.product
  end
end
