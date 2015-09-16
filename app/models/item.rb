class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.random
    self.order("RANDOM()").first
  end

  def self.most_revenue(quantity)
    ids = Invoice.success.joins(:items).group(:item_id).sum(('quantity * invoice_items.unit_price'))
    .sort_by{|item_revenue_pair| item_revenue_pair.last}.reverse[0...quantity].map(&:first)

    ids.map do |item_id|
      Item.find_by(id: item_id)
    end
  end

  def self.most_items(quantity)
    ids = Invoice.success.joins(:items).group(:item_id).sum(('quantity'))
    .sort_by{|key, value| value}.reverse[0...quantity].map(&:first)

    ids.map do |item_id|
      Item.find_by(id: item_id)
    end
  end

  def best_day
    self.invoices.success.group("invoices.created_at").sum('quantity * unit_price')
    .sort_by{|key, value| value}.reverse.first.first

    # invoices = self.success.where(created_at: params[:date])
    # invoices.total_revenue(invoices.pluck(:id))
  end

  private

  def get_invoice_items
    self.invoice_items
  end
end
