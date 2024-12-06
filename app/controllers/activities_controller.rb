class ActivitiesController < ApplicationController
  before_action :set_pet

  def index
    @pet = Pet.find(params[:pet_id])
    @activities = @pet.activities
    @activity = @pet.activities.new
  end

  def new
    @activity = @pet.activities.new
  end

  def create
    @activity = @pet.activities.new(activity_params)
    if @activity.save
      redirect_to pet_activities_path(@pet), notice: 'Activity added successfully!'
    else
      render :new
    end
  end

  def edit
    @activity = @pet.activities.find(params[:id])
  end

  def update
    @activity = @pet.activities.find(params[:id])
    if @activity.update(activity_params)
      redirect_to pet_activities_path(@pet), notice: 'Activity updated successfully!'
    else
      render :edit
    end
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def activity_params
    params.require(:activity).permit(:training_type, :rating, :notes, :video_url)
  end
end
