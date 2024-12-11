
class HygieneController < ApplicationController
  # ...existing code...

  def show
    @hygiene = Hygiene.find(params[:id])
    # ...existing code...
  end

  # ...existing code...
end