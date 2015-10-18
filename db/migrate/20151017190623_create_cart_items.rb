class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :cart_id, null: false
      t.integer :hat_id, null: false
      t.integer :price_in_cents, null: false
      t.integer :quantity, default: 1, null: false

      t.timestamps null: false
    end
  end
end
