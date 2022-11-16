class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content
      t.string :product_id
      t.timestamps
    end
  end
end
