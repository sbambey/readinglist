class AmazonBooksService

	def initialize(params)
		@isbns = params[:isbns]
	end

	def search
		result = item_lookup.to_h["ItemLookupResponse"]["Items"]["Item"]
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
		service.configure(
	    aws_access_key_id: ENV["AMAZON_ADVERTISING_ACCESS_KEY_ID"],
	    aws_secret_access_key: ENV["AMAZON_ADVERTISING_SECRET_ACCESS_KEY"],
	    associate_tag: ENV["ASSOCIATE_TAG"]
		)
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