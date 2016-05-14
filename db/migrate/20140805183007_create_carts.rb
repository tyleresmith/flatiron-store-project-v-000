class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :title
      t.integer :inventory
      t.integer :price
      t.integer :category_id
 
      t.timestamps null: false
    end
  end
end
