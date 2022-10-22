class Api::V1::CarsController < ApplicationController
  skip_before_action :authenticated

  # GET /cars
  def index
    # @cars = Car.all.to_json(include: [:image])
    @cars = Car.all
    # Car.all.each do |car|
    #   @cars.push(car.as_json.merge({ image: url_for(car.image) }))
    # end

    render json: @cars
  end

  # GET /cars/1
  def show
    # @res = []
    @car = Car.find(params[:id])
    # @res.push(@car.as_json.merge({ image: url_for(@car.image) }))

    render json: @car
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      render json: @car, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/cars/1
  def destroy
    @car = Car.find(params[:id])
    if @car.destroy
      render json: { message: 'Car Removed' }, status: :ok
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.permit(:brand, :finance_fee, :model, :purchase_fee, :image, :tap, :duration, :description)
  end
end
