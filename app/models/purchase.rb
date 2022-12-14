class Purchase < ApplicationRecord
  belongs_to :client
  before_save :set_total_products
  before_save :set_total_amount
  has_many :purchase_items
  accepts_nested_attributes_for :purchase_items

  def set_total_products
    self.total_products = purchase_items.sum(&:quantity)
  end

  def set_total_amount
    self.total_amount = purchase_items.sum(&:total)
  end

  def self.search(params)
    purchases = Purchase.includes(purchase_items: [product: [product_categories: [:category]]])
    if params[:start_date].present? && params[:end_date].present?
      purchases = purchases.where(date: params[:start_date].to_time.strftime("%Y-%m-%d 00:00:00")..params[:end_date]
      .to_time.strftime("%Y-%m-%d 23:59:59"))
    end
    purchases = purchases.where(purchase_items: { products: { id: params[:product_id] } }) if params[:product_id].present?
    purchases = purchases.where(purchase_items: { categories: { id: params[:category_id] } }) if params[:category_id].present?
    purchases
  end

  def self.graph(params)
    purchases = Purchase.all
    if params[:start_date].present? && params[:end_date].present?
      purchases = purchases.where(date: params[:start_date].to_time.strftime("%Y-%m-%d %H:%M")..params[:end_date].to_time.strftime("%Y-%m-%d %H:%M"))
    end
    purchases
  end
end
