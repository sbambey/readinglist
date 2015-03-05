class ProductSearch
	def initialize(params)
		@term = params[:term]
	end

	def search
		search
	end

	private

	def service
		Vacuum.new
	end

end