class SalonsController < ApplicationController
before_action :set_salon, only: [:show, :edit, :update, :destroy]
  
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
    @salon = Salon.new(salon_params)
    respond_to do |format|
      if @salon.save
        format.html { redirect_to @salon, notice: 'Salon was successfully created.' }
        format.json { render :show, status: :created, location: @salon }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to @salon, notice: 'Salon was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @salon.destroy
    respond_to do |format|
      format.html { redirect_to salons_path, notice: 'Salon was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_salon
      @salon = Salon.find(params[:id])
    end

    def salon_params
      params.require(:salon).permit(:name, :description, :address)
    end   

end
