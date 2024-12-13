class ActivitiesController < ApplicationController
  before_action :set_pet
  before_action :set_activity, only: [:edit, :update, :destroy, :remove_video] # ajout de remove_video ici
  
  def remove_video
    @activity.video.purge
    redirect_to edit_pet_activity_path(@pet, @activity), notice: 'Video was successfully removed.'
  end

  def index
    @activities = @pet.activities
  end

  def new
    @activity = @pet.activities.new
  end

  def create
    @activity = @pet.activities.new(activity_params)
    if @activity.save
      redirect_to pet_activities_path(@pet), notice: 'Activity added successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to pet_activities_path(@pet), notice: 'Activity updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @activity.destroy
    redirect_to pet_activities_path(@pet), notice: 'Activity deleted successfully!'
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_activity
    @activity = @pet.activities.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:training_type, :rating, :notes, :video)
  end
end