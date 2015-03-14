class ShortUrlsController < ApplicationController
	before_action :authenticate_user!, except: [:show]
	
	def show
		@short_url = ShortUrl.friendly.find(params[:id])
		redirect_to @short_url.list, status: 301
	end
end
