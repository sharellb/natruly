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

  def show
    @salon = Salon.find_by_id(params[:id])
    if @salon
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end

  def edit
    @salon = Salon.find_by_id(params[:id])
  end

  def update
    @salon = Salon.find_by_id(params[:id])
    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to @salon, notice: 'Salon was successfully updated.' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def salon_params
      params.require(:salon).permit(:name, :description, :address)
    end   

end
