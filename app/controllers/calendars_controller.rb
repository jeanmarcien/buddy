# app/controllers/calendars_controller.rb
class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def events
	treatments = current_user.pets.flat_map do |pet|
	  pet.treatments.where('renew_date IS NOT NULL')
	end
	
	events = treatments.map do |treatment|
	  {
		id: treatment.id,
		title: "Renewal: #{treatment.name} (#{treatment.pet.name})",
		start: treatment.renew_date,
		backgroundColor: '#f4a258',
		borderColor: '#f4a258',
		extendedProps: {
		  treatment_id: treatment.id,
		  pet_id: treatment.pet_id
		}
	  }
	end

	render json: events
  end
end