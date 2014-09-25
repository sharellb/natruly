class ProfilesController < ApplicationController
	def show
		@user = User.find_by_profile_name(params[:id])
		@videos = @user.get_voted(Video)
		@salons = @user.get_voted(Salon)
		if @user
			render action: :show
		else
			render file: 'public/404', status: 404, formats: [:html]
		end
	end
end
