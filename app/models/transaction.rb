class Transaction < ActiveRecord::Base
  belongs_to :customer
  belongs_to :invoice

  def self.random
    self.order("RANDOM()").first
  end
end
