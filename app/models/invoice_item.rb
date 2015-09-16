class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def self.random
    self.order("RANDOM()").first
  end
end
