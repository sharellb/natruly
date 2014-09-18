class SalonsController < ApplicationController
  def index
  	@salons = Salon.all
  	@hash = Gmaps4rails.build_markers(@salons) do |salon, marker|
	  	marker.lat salon.latitude
	  	marker.lng salon.longitude
  	end
  end
end
