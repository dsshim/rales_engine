class AddColumnUnitPriceToInvoiceItems < ActiveRecord::Migration
  def change
    add_column :invoice_items, :unit_price, :decimal
  end
end
