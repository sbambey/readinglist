class GoogleBooksService

	def initialize(params)
		@title = params[:title]
		@ip = params[:ip]
	end

	def search
		item_lookup
	end

	private

	def service
		GoogleBooks
	end

	def item_lookup
		service.search(@title, {count: 1, api_key: ENV["GOOGLE_API_KEY"]}, @ip).first
	end
end