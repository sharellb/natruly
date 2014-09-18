class SalonsController < ApplicationController
  def index
  	@salons = Salon.all
  	@hash = Gmaps4rails.build_markers(@salons) do |salon, marker|
	  	marker.lat salon.latitude
	  	marker.lng salon.longitude
  	end
  end
  def new
  	@salon = Salon.new
  end

  def create
    @salon = Salon.new(params.require(:salon).permit(:address))
    if @salon.save
      flash[:success] = 'Salon added!'
      redirect_to salons_path
    else
      render 'new'
    end
  end
end
