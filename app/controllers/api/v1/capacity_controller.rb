class Api::V1::CapacityController < ApplicationController
  before_action :set_capacity, only: %i[ show update destroy]

  def index
    @capacity = Capacity.all

    render json: @capacity
  end

  def show
    render json: @capacity
  end

  def create
    @capacity = Capacity.create(capacity_params)

    if @capacity.save
      render json: @capacity, status: :created
    else
      render json: @capacity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @capacity.update(capacity_params)
      render json: @capacity
    else
      render json: @capacity.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @capacity.destroy
  end

  private

  def set_capacity
    @capacity = Capacity.find(params[:id])
  end

  def capacity_params
    params.permit(:width, :height, :length, :num_of_pallets)
  end

end
