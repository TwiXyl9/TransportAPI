class CreateDeliveryTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_types do |t|
      t.string :name
      t.integer :price
      t.timestamps
    end
  end
end
