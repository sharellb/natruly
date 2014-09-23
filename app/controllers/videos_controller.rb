class VideosController < ApplicationController
before_action :set_video, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite, :tag]
	def index
  		@videos = Video.order('created_at DESC')
	end

	def new
	  @video = Video.new
	end
	 
	def create
	  @video = Video.new(video_params)
	  if @video.save
	    flash[:success] = 'Video added!'
	    redirect_to videos_path
	  else
	    render 'new'
	  end
	end

	def show
	end

	def destroy
		@video.destroy
		redirect_to video_path
	end

	def favorite
		@video.liked_by current_user
		redirect_to videos_path
	end

	def unfavorite
		@video.unliked_by current_user
		redirect_to videos_path
	end

	def tag
		redirect_to videos_path
	end

	private
		def set_video
			@video = Video.find(params[:id])
		end
		
		def video_params
			params.require(:video).permit(:link, :tag_list, :title, :author)
		end
end
