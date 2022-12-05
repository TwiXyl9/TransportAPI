class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :start_point, foreign_key: { to_table: 'points' }
      t.references :end_point, foreign_key: { to_table: 'points' }
      t.timestamps
    end
  end
end
