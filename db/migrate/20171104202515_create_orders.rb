class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status, default: 0
      t.float :price
      t.text :contents
      
      t.timestamps
    end
  end
end
