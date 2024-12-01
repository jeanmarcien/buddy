class TreatmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet
  
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def set_pet
    @pet = Pet.find(params[:pet_id])
  end
end
