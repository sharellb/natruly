class UsersController < ApplicationController
  def new
  end
  def show
  	@user = User.find(params[:id])
  	@videos = current_user.favorite_videos
  end
end
