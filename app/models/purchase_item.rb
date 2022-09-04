class PurchaseItem < ApplicationRecord
  belongs_to :purchase
  belongs_to :product

  validates :purchase_id, uniqueness: { scope: :product_id }

  before_create :set_total

  def set_total
    self.total = quantity * product.price
  end
end
