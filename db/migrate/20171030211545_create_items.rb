class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :title
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
