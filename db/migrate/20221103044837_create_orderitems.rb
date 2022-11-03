class CreateOrderitems < ActiveRecord::Migration[7.0]
  def change
    create_table :orderitems do |t|
      t.belongs_to :cart, null: false, foreign_key: true
      t.integer :quantity
      t.string :set_price
      t.string :set_name

      t.timestamps
    end
  end
end
