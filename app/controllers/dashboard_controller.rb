class DashboardController < ApplicationController
  def index
    @pets = current_user.pets
  end

  def index
    @pets = current_user.pets.order(:name)
  end
end
