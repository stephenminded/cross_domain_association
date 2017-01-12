class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :price
      t.references :customer

      t.timestamps
    end
  end
end
