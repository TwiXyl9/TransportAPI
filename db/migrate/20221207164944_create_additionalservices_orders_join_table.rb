class CreateAdditionalservicesOrdersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :additional_services, :orders
  end
end
