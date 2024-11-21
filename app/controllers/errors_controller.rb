class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:not_found]
  
  def not_found
	render status: :not_found
  end
end