class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :is_active, null: false, default: 

      t.timestamps
    end
  end
end
