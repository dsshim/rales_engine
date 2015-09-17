class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.random
    self.order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.find(success.favorite_merchant)
  end

private
  def success
    self.invoices.success
  end
end
