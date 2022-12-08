class OrdersRepresenter
  attr_reader :orders

  def initialize(orders)
    @orders = orders
  end

  def to_json
    orders.map do |order|
      {
        id: order.id,
        phone: order.phone,
        cargo_type: order.cargo_type.name,
        delivery_type: order.delivery_type.name,
        delivery_type_price: order.delivery_type.price,
        additional_services: order.additional_services,
        car: "#{order.car.brand} #{order.car.model}",
        route: {
          start_point: order.route.start_point,
          end_point: order.route.end_point
        }
      }
    end
  end
end
