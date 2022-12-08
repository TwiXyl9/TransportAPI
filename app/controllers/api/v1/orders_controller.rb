class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: %i[ show update destroy]

  def index
    @orders = Order.all
    render json: OrdersRepresenter.new(@orders).to_json
  end

  def show
    render json: @order
  end

  def create
    @start_point = get_point(start_point_params)
    @end_point = get_point(end_point_params)
    @route = Route.find_or_create_by(start_point: @start_point, end_point: @end_point)
    if !@route.id
      render json: @route.errors, status: :unprocessable_entity if !@route.save
    else
      @order = Order.create(order_params)
      if @order.save
        render json: OrdersRepresenter.new(Array(@order)).to_json , status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def start_point_params
    params.require(:route).require(:start_point).permit(:latitude, :longitude, :address)
  end

  def end_point_params
    params.require(:route).require(:end_point).permit(:latitude, :longitude, :address)
  end

  def order_params
    params[:order].merge!(:route_id => @route.id)
    params.require(:order).permit(:phone, :cargo_type_id, :car_id, :delivery_type_id, :route_id)
  end

  def get_point(parameters)
    @point = Point.find_or_create_by(latitude: parameters[:latitude], longitude: parameters[:longitude], address: parameters[:address])
    if !@point.id
      render json: @point.errors, status: :unprocessable_entity if !@point.save
    end
    @point
  end
end
