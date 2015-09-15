require 'csv'

desc "Import data from csv file"
task :import => [:environment] do

  customer_file = "db/data/customers.csv"
  merchant_file = "db/data/merchants.csv"
  invoice_item_file = "db/data/invoice_items.csv"
  invoice_file = "db/data/invoices.csv"
  item_file = "db/data/items.csv"
  transaction_file = "db/data/transactions.csv"

  CSV.foreach(customer_file, :headers => true, header_converters: :symbol) do |row|
    Customer.create!(row.to_hash)
  end

  CSV.foreach(merchant_file, :headers => true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach(invoice_file, :headers => true, header_converters: :symbol) do |row|
    Invoice.create!(row.to_hash)
  end

  CSV.foreach(item_file, :headers => true, header_converters: :symbol) do |row|
    Item.create!(row.to_hash)
  end

  CSV.foreach(invoice_item_file, :headers => true, header_converters: :symbol) do |row|
    InvoiceItem.create!(row.to_hash)
  end

  CSV.foreach(transaction_file, :headers => true, header_converters: :symbol) do |row|
    Transaction.create!(row.to_hash)
  end

end

# namespace :import do
#   desc "Import invoices from csv"
#   task invoices: :environment do
#     filename = File.join Rails.root, "db/invoices.csv"
#     CSV.foreach(filename, headers: true) do |row|
#       Invoice.create (
#             id: row['id'],
#             customer_id: row['customer_id'],
#             merchant_id: row['merchant_id'],
#             status: row['status'],
#             created_at: row['created_at'],
#             updated_at: row['updated_at']
#           )
#   end
# end
# end
