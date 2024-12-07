class PetsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_pet, only: [:show, :edit, :update, :destroy, :calendar]
  before_action :verify_pet_owner, only: [:show, :edit, :update, :destroy, :calendar]

  def index
    @pets = current_user.pets.order(:name)
  end

  def show
    @pet = Pet.find(params[:id])
    @recent_measurements = @pet.measurements.order(date: :desc).limit(3)
    @active_treatments = @pet.treatments.where("end_date >= ?", Date.today).order(end_date: :asc).limit(3)
    @recent_activities = @pet.activities.order(created_at: :desc).limit(3)
    @hygiene_records = @pet.hygienes.order(date: :desc).limit(3)
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pets_path, notice: 'Pet successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet successfully update.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Pet successfully deleted.'
  end

  def calendar
  end

  private

  def set_pet
    @pet = current_user.pets.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to pets_path, alert: 'Pet not found.'
  end

  def pet_params
    params.require(:pet).permit(:name, :specie, :gender, :breed, :birth_day, :vet_id, :photo)
  end

  def verify_pet_owner
    unless @pet.user == current_user
      flash[:alert] = "Vous n'êtes pas autorisé à accéder à cet animal"
      redirect_to dashboard_path
    end
  end
end
