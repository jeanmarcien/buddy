class HygienesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet
  before_action :set_hygiene, only: [:edit, :update, :destroy]

  def index
    @hygienes = @pet.hygienes
    respond_to do |format|
      format.html # renders app/views/hygienes/index.html.erb
      format.json { render json: @hygienes }
    end
  end

  def new
    @hygiene = @pet.hygienes.new
  end

  def create
    @hygiene = @pet.hygienes.build(hygiene_params)
    if @hygiene.save
      redirect_to pet_hygienes_path(@pet), notice: 'Hygiene successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @hygiene.update(hygiene_params)
      redirect_to pet_hygienes_path(@pet), notice: 'Hygiene successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hygiene.destroy
    redirect_to pet_hygienes_path(@pet), notice: 'Hygiene successfully deleted.'
  end

  private

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_hygiene
    @hygiene = @pet.hygienes.find(params[:id])
  end

  def hygiene_params
    params.require(:hygiene).permit(:hygiene_type, :date, :frequency, :note)
  end
end
