class VideosController < ApplicationController
	def user_params
		params.require(:video).permit(:id, :tag_list)
	end

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

	def destroy
	end

	def favorite
		@video = Video.find(params[:id])
		@video.liked_by current_user
		redirect_to videos_path
	end

	def unfavorite
		@video = Video.find(params[:id])
		@video.unliked_by current_user
		redirect_to videos_path
	end

	def tag
		@video = Video.find(params[:id])
		redirect_to videos_path
	end
end
