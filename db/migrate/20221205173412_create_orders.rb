class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :phone
      t.integer :stage
      t.timestamps
    end
    add_reference :orders, :car, null: false, foreign_key: true
    add_reference :orders, :route, null: false, foreign_key: true
    add_reference :orders, :cargo_type, null: false, foreign_key: true
    add_reference :orders, :delivery_type, null: false, foreign_key: true
  end
end
