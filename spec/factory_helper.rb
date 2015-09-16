def build_data
  Merchant.create(id: 1, name: "merchant")
  Merchant.create(id: 2, name: "merchant 2")
  Merchant.create(id: 3, name: "merchant 3")
  Merchant.create(id: 4, name: "merchant 4")
  Merchant.create(id: 5, name: "merchant 5")

  Item.create(id: 1, name: "item name", description: "item desc", unit_price: 7472, merchant_id: 1)
  Item.create(id: 2, name: "item name 2", description: "item desc 2", unit_price: 5050, merchant_id: 2)
  Item.create(id: 3, name: "item name 2", description: "item desc 2", unit_price: 5050, merchant_id: 3)
  Item.create(id: 4, name: "item name 2", description: "item desc 2", unit_price: 5050, merchant_id: 4)
  Item.create(id: 5, name: "item name 2", description: "item desc 2", unit_price: 5050, merchant_id: 5)

  Customer.create(id: 1, first_name: "bob", last_name: "bobson")
  Customer.create(id: 2, first_name: "rob", last_name: "robson")
  Customer.create(id: 3, first_name: "job", last_name: "jobson")

  Invoice.create(id: 1, customer_id: 1, merchant_id: 1, status: "shipped")
  Invoice.create(id: 2, customer_id: 2, merchant_id: 2, status: "shipped")
  Invoice.create(id: 3, customer_id: 3, merchant_id: 3, status: "shipped")
  Invoice.create(id: 4, customer_id: 2, merchant_id: 4, status: "shipped")
  Invoice.create(id: 5, customer_id: 1, merchant_id: 5, status: "shipped")

  InvoiceItem.create(id: 1, item_id: 1, invoice_id: 1, quantity: 30, unit_price: 8797)
  InvoiceItem.create(id: 2, item_id: 2, invoice_id: 2, quantity: 10, unit_price: 8797 )
  InvoiceItem.create(id: 3, item_id: 3, invoice_id: 3, quantity: 10, unit_price: 8797 )
  InvoiceItem.create(id: 4, item_id: 4, invoice_id: 4, quantity: 10, unit_price: 8797 )
  InvoiceItem.create(id: 5, item_id: 5, invoice_id: 5, quantity: 10, unit_price: 8797 )

  Transaction.create(id: 1, invoice_id: 1, credit_card_number: "4242424242", result: "success")
  Transaction.create(id: 2, invoice_id: 2, credit_card_number: "4242424242", result: "success")
  Transaction.create(id: 3, invoice_id: 3, credit_card_number: "4242424242", result: "success")
  Transaction.create(id: 4, invoice_id: 4, credit_card_number: "4242424242", result: "success")
  Transaction.create(id: 5, invoice_id: 5, credit_card_number: "4242424242", result: "success")
  Transaction.create(id: 6, invoice_id: 1, credit_card_number: "4242424252", result: "failed")
end
