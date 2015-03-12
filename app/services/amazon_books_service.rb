class AmazonBooksService

	def initialize(params)
		@isbns = params[:isbns]
	end

	def search
		result = item_lookup.to_h
		if result.kind_of?(Array)
			result
		elsif result.nil?
			[]
		else
			[result]
		end
	end

	private

	def service
		service = Vacuum.new
		service.associate_tag = ENV["ASSOCIATE_TAG"]
		service
	end

	def item_lookup
		service.item_lookup(
			query: {
				'SearchIndex' => 'Books',
				'ResponseGroup' => 'ItemAttributes',
				'IdType' => 'ISBN',
				'ItemId' => @isbns.join(", ")
			}
		)
	end
end