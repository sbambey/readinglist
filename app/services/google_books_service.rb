class GoogleBooksService

	def initialize(params)
		@title = params[:title]
	end

	def search
		item_lookup
	end

	private

	def service
		GoogleBooks
	end

	def item_lookup
		service.search(@title, {count: 1}, api_key: ENV["GOOGLE_API_KEY"]).first
	end
end