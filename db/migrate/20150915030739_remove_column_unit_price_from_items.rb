class RemoveColumnUnitPriceFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :unit_price
  end
end
