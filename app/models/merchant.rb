class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.random
    self.order("RANDOM()").first
  end

  def favorite_customer
    Customer.where(id: success.favorite_customer)
  end

  def success
    self.invoices.success
  end

  def failed
    self.invoices.failed
  end

  def total_revenue(params)
    if params.include?("date")
      invoices = self.success.where(created_at: params[:date])
      invoices.total_revenue(invoices.pluck(:id))
    else
      self.success.total_revenue(success.pluck(:id))
    end
  end

  def customers_with_pending_invoices
    self.failed.customers_with_pending_invoices(failed.pluck(:customer_id))
  end

  def self.most_revenue(quantity)
    all.sort_by do |merchant|
      merchant.invoices.success.joins(:invoice_items).sum("quantity * unit_price")
    end.reverse[0...quantity]
  end

  def self.most_items(quantity)
    all.sort_by do |merchant|
      merchant.invoices.success.joins(:invoice_items).sum("quantity")
    end.reverse[0...quantity]
  end
end
