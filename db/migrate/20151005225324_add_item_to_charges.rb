class AddItemToCharges < ActiveRecord::Migration
  def change
     add_column :charges, :item_id, :int
  end
end
