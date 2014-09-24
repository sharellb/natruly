class StylesController < ApplicationController
	def show
		@tag = ActsAsTaggableOn::Tag.find_by_slug(params[:id])
		
		if @tag
			render action: :show
		else
			render file: 'public/404', status: 404, formats: [:html]
		end
	end
end
