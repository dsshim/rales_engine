class ReorderColumnsInItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.change :unit_price, :float, after: :description
      t.change :merchant_id, :integer, after: :unit_price
    end
  end
end
