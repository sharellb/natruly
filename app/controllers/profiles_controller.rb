class ProfilesController < ApplicationController
	def show
		@user = User.find_by_profile_name(params[:id])
		@videos = current_user.favorite_videos
		if @user
			render action: :show
		else
			render file: 'public/404', status: 404, formats: [:html]
		end
	end
end
