class Point < ApplicationRecord
  has_many :start_routes, :class_name => "Route", :foreign_key => "start_point"
  has_many :end_routes, :class_name => "Route", :foreign_key => "end_point"
end
