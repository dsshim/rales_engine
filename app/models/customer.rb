class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices
  has_many :transactions, through: :invoices

  def self.random
    order("RANDOM()").first
  end

  def favorite_merchant
    Merchant.find(success.favorite_merchant)
  end

private
  def success
    invoices.success
  end
end
