class MeasurementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet
  before_action :set_measurement, only: [:edit, :update, :destroy]
  
  def index
    @measurements = @pet.measurements.order(date: :desc)
  end

  def new
    @measurement = @pet.measurements.new
  end

  def create
    @measurement = @pet.measurements.build(measurement_params)
  
    if @measurement.save
      redirect_to pet_measurements_path(@pet), notice: 'Measurement successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @measurement.update(measurement_params)
      redirect_to pet_measurements_path(@pet), notice: 'Measurement successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @measurement.destroy
    redirect_to pet_measurements_path(@pet), notice: 'Measurement successfully deleted.'
  end
  
  private
  
  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_measurement
    @measurement = @pet.measurements.find(params[:id])
  end
  
  def measurement_params
    params.require(:measurement).permit(:measurement_type, :value, :date, :notes)
  end
end