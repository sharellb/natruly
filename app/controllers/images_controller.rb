class ImagesController < ApplicationController
	before_action :set_image, only: [:show, :edit, :update, :destroy]
  
  def index
  	@images = Image.all
  end
  
  def new
  	@image = Image.new
  end

  def create
    @image = Image.new(image_params)
    image_size = FastImage.size(@image.link)
    @image.user = current_user
    if image_size[0] < 600 && image_size[1] < 800
      @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @image.update(image_params)
      redirect_to @image
      render 'show'
    else
      render 'edit'
    end
  end

  def destroy
    @image.destroy
    redirect_to images_path
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:name, :link, :description)
    end   
end
