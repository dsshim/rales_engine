class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.random
    self.order("RANDOM()").first
  end

  def self.success
    self.joins(:transactions).where(:transactions => {result: "success"})
  end

  def self.failed
    self.joins(:transactions).where(:transactions => {result: "failed"})
  end

  def self.favorite_merchant
    self.joins(:merchant).group(:merchant_id).count.sort_by {|key, value| [value, key]}.reverse.first[0]
  end

  def self.favorite_customer
    self.joins(:customer).group(:customer_id).count.sort_by {|key, value| [value, key]}.reverse.first[0]
  end

  def self.transactions(ids)
    Transaction.where(invoice_id: ids)
  end

  def self.total_revenue(ids)
    {revenue: "%.2f" % (InvoiceItem.where(invoice_id: ids).map{|ii| ii.quantity * ii.unit_price.to_f}.inject(:+))}
  end

  def self.customers_with_pending_invoices(ids)
    Customer.where(id: ids)
  end
end
