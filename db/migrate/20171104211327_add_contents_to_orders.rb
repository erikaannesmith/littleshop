class AddContentsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :contents, :hstore
    add_index :orders, :contents, using: :gist
  end
end
