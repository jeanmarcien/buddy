class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet
  before_action :set_treatment, only: [:edit, :update, :destroy]
  
  def index
    @treatments = @pet.treatments.order(start_date: :desc)
  end

  def new
    @treatment = @pet.treatments.new
  end

  def create
    @treatment = @pet.treatments.build(treatment_params)

    if @treatment.save
      redirect_to pet_treatments_path(@pet), notice: 'Treatment successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @treatment.update(treatment_params)
      redirect_to pet_treatments_path(@pet), notice: 'Treatment successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @treatment.destroy
    redirect_to pet_treatments_path(@pet), notice: 'Treatment successfully deleted.'
  end

  private
  
  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_treatment
    @treatment = @pet.treatments.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:name, :treatment_type, :start_date, :end_date, :dosage, :frequency, :notes, :renew_date)
  end
end