class NutritionsController < ApplicationController
  before_action :set_pet
  before_action :set_nutrition, only: [:edit, :update, :destroy]

  def index
    @nutritions = @pet.nutritions
  end

  def new
    @nutrition = @pet.nutritions.new
  end

  def create
    @nutrition = @pet.nutritions.new(nutrition_params)
    if @nutrition.save
      redirect_to pet_nutritions_path(@pet), notice: 'Nutrition record added successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @nutrition.update(nutrition_params)
      redirect_to pet_nutritions_path(@pet), notice: 'Nutrition record updated successfully!'
    else
      render :edit
    end
  end

  def destroy
    @nutrition.destroy
    redirect_to pet_nutritions_path(@pet), notice: 'Nutrition record deleted successfully!'
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_nutrition
    @nutrition = @pet.nutritions.find(params[:id])
  end

  def nutrition_params
    params.require(:nutrition).permit(:times_per_day, :quantity, :food_type, :brand, :price, :reminder_date)
  end
end
