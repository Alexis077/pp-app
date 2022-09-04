class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :available_units
end
