class Order < ApplicationRecord
  belongs_to :car
  belongs_to :cargo_type
  belongs_to :delivery_type
  has_and_belongs_to_many :additional_services

end
