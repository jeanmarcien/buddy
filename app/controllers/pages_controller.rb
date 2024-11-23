class PagesController < ApplicationController
  before_action :redirect_if_authenticated, only: [:index, :about, :how]
  skip_before_action :authenticate_user!, only: [:index, :about, :how]
 
 def index
 end
 
 def about
 end
 
 def how
 end

 private

 def redirect_if_authenticated
   redirect_to dashboard_index_path if user_signed_in?
 end
end
