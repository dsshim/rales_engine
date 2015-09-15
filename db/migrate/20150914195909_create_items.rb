class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.text :description
      t.integer :unit_price
      t.string :merchant_id
      t.string :integer

      t.timestamps
    end
  end
end
