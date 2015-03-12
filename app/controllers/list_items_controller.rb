class ListItemsController < ApplicationController
	before_action :authenticate_user!
	
	def retrieve_google_book

		@title = params[:title]
		@book = retrieve_book_info(params[:title])

		respond_to do |format|
      format.js
    end
	end

	private

	# Fulltext search Google Books API to get title, ISBN and more
	def retrieve_book_info(title)
		googlebooks_item = book_from_title(title)

		item = {}
		item["title"] = googlebooks_item.title
		item["author"] = googlebooks_item.authors
		item["is_ebook"] = googlebooks_item.sale_info["isEbook"]
		item["isbn"] = googlebooks_item.isbn
		item["website"] = googlebooks_item.info_link
		item["categories"] = googlebooks_item.categories
		item["image_link"] = googlebooks_item.image_link(zoom: 5)

		return item
	end

	def book_from_title(title)
		GoogleBooksService.new({
			title: title,
			ip: request.remote_ip
		}).search
	end
end
