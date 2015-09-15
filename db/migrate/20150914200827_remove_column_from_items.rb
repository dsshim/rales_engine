class RemoveColumnFromItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.remove :merchant_id
      t.remove :integer
    end
  end
end
