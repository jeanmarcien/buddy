class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :about, :how], if: :devise_controller?

 def index
 end

 def about
 end

 def how
 end

 def home
 end

 def health
 end

 def nutrition
 end

 def activities
 end
end
