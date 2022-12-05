class CreateCapacities < ActiveRecord::Migration[7.0]
  def change
    create_table :capacities do |t|
      t.float :width
      t.float :heigth
      t.float :length
      t.float :num_of_pallets
      t.timestamps
    end
  end
end
