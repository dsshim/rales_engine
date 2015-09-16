class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :items

  def self.random
    self.order("RANDOM()").first
  end

  def favorite_customer
    Customer.find(success.favorite_customer)
  end

  def success
    self.invoices.success
  end

  def total_revenue
    self.success.total_revenue(success.pluck(:id))
  end
end
