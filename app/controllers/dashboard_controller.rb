class DashboardController < ApplicationController
  def index
    @pets = current_user.pets
  end
end