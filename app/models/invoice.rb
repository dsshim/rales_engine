class Invoice < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.random
    order("RANDOM()").first
  end

  def self.success
    joins(:transactions).where(transactions: {result: "success"})
  end

  def self.failed
    joins(:transactions).where(transactions: {result: "failed"})
  end

  def self.favorite_merchant
    joins(:merchant).group(:merchant_id).count
      .sort_by {|key, value| [value, key]}.reverse.first.first
  end

  def self.favorite_customer
    joins(:customer).group(:customer_id).count
      .sort_by {|key, value| [value, key]}.reverse.first.first
  end
end
