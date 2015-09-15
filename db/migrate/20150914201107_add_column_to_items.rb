class AddColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :merchant_id, :integer
  end
end
