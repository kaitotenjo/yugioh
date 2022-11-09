class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.string :total, default: "0"
      t.string :set_price
      t.string :set_name

      t.timestamps
    end
  end
end
