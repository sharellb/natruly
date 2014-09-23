class SalonsController < ApplicationController
before_action :set_salon, only: [:show, :edit, :update, :destroy, :recommend, :unrecommend]
  
  def index
  	@salons = Salon.all
  	@hash = Gmaps4rails.build_markers(@salons) do |salon, marker|
	  	marker.lat salon.latitude
	  	marker.lng salon.longitude
      marker.infowindow salon.name
      marker.title salon.name
  	end
  end
  
  def new
  	@salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      redirect_to @salon
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @salon.update(salon_params)
      redirect_to @salon
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @salon.destroy
    redirect_to salons_path
  end

  def recommend
    @salon.liked_by current_user
    redirect_to @salon
  end

  def unrecommend
    @salon.unliked_by current_user
    redirect_to @salon
  end

  private
    def set_salon
      @salon = Salon.find(params[:id])
    end

    def salon_params
      params.require(:salon).permit(:name, :description, :address)
    end   

end
