class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :list_orders, null: false, foreign_key: true
      t.decimal :subtotal
      t.decimal :total
      t.integer :status
      t.timestamps
    end
  end
end
