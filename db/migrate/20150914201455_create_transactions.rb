class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.text :credit_card_number
      t.text :credit_card_expiration_date
      t.text :result
      t.timestamps
    end
  end
end
