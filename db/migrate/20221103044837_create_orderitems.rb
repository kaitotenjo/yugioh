class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.references :order, null: false, foreign_key: true
      t.integer :quantity
      t.decimal :total, default: 0
      t.string :set_price
      t.string :set_name
      t.string :card_name
      t.string :card_image

      t.timestamps
    end
  end
end
