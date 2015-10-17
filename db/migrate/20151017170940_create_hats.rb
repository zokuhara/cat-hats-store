class CreateHats < ActiveRecord::Migration
  def change
    create_table :hats do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end
end
