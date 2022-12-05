class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model

      t.timestamps
    end
    add_reference :cars, :capacity, null: false, foreign_key: true
  end
end
