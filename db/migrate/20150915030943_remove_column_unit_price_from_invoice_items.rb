class RemoveColumnUnitPriceFromInvoiceItems < ActiveRecord::Migration
  def change
    remove_column :invoice_items, :unit_price
  end
end
