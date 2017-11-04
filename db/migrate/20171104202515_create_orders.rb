class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      enable_extension "hstore"
      t.string :status, default: 0
      t.float :price
      
      t.timestamps
    end
  end
end