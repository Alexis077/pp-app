class Purchase < ApplicationRecord
  belongs_to :client
  before_create :set_total_products
  before_save :set_total_amount
  has_many :purchase_items
  accepts_nested_attributes_for :purchase_items

  def set_total_products
    self.total_products = purchase_items.sum(:quantity)
  end

  def set_total_amount
    self.total_amount = purchase_items.sum(:total)
  end
end
