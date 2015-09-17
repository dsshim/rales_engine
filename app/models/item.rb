class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    all.sort_by{|item| item.revenue}.reverse[0...quantity]
  end

  def self.most_items(quantity)
    amount_sold(quantity).map{|id| Item.find_by(id: id)}
  end

  def best_day
    {best_day: invoices.success.group("invoices.created_at").sum('quantity * unit_price')
    .sort_by{|key, value| value}.reverse.first.first}
  end

  def revenue
    invoices.success.joins(:invoice_items).sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.amount_sold(quantity)
    Invoice.success.joins(:items).group(:item_id).sum("quantity")
      .sort_by{|k,v| v}.reverse[0...quantity].map(&:first)
  end
end
