class AddCharges < ActiveRecord::Migration
 def change
    create_table :charges do |t|
      t.references :user
      t.text :customer_charge_id
      t.timestamps
    end
    add_index :charges, :user_id
  end
end
