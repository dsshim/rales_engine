class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.random
    self.order("RANDOM()").first
  end

  def favorite_customer
    Customer.find_by(id: success.favorite_customer)
  end

  def success
    self.invoices.success
  end

  def failed
    self.invoices.failed
  end

  def total_revenue
    {revenue: self.invoices.success.joins(:invoice_items).sum("quantity * unit_price")}
  end

  def total_revenue_by_date(date)
    {revenue: self.invoices.success.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price")}
  end

  def customers_with_pending_invoices
    failed.map{|invoice| invoice.customer}.uniq
  end

  def self.most_revenue(quantity)
    self.all.sort_by do |merchant|
      merchant.invoices.success.joins(:invoice_items).sum("quantity * unit_price")
    end.reverse[0...quantity]
  end

  def self.most_items(quantity)
    self.all.sort_by do |merchant|
      merchant.invoices.success.joins(:invoice_items).sum("quantity")
    end.reverse[0...quantity]
  end

  def self.revenue(date)
    revenue = self.all.map do |merchant|
      merchant.invoices.where(created_at: date)
        .success.joins(:invoice_items).sum("quantity * unit_price")
    end
    {total_revenue: revenue.inject(:+)}
  end
end
