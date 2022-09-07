class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :product

  validates :purchase_id, uniqueness: { scope: :product_id }

  after_initialize :set_total

  def set_total
    self.total = quantity * product.price
  end
end
