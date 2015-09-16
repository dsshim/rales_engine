class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  def self.random
    self.order("RANDOM()").first
  end

  def transactions
    customer_invoices.transactions(customer_invoices.pluck(:id))
  end

  def favorite_merchant
    Merchant.find(success.favorite_merchant)
  end

  def customer_invoices
    self.invoices
  end

  def success
    self.invoices.success
  end
end
