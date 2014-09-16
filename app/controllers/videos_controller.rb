class VideosController < ApplicationController
	def new
	  @video = Video.new
	end
	 
	def create
	  @video = Video.new(params.require(:video).permit(:link))
	  if @video.save
	    flash[:success] = 'Video added!'
	    redirect_to videos_path
	  else
	    render 'new'
	  end
	end

	def index
  		@videos = Video.order('created_at DESC')
	end
end
