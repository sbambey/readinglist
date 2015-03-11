class ListsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	#require 'json'

	def index
		@lists = List.search(params[:search]).paginate(per_page: 10, page: params[:page])
		#@matched = JSON.pretty_generate(amazon_books_by_isbns(["9780132930888"]))
	end

	def show
		@list = List.friendly.find(params[:id])
	end

	def new
		@list = List.new
		@list.list_items.build
	end

	def create
		create_params = list_params
		create_params[:unique_identifier] = create_unique_identifier
		@list = current_user.lists.new(create_params)

		prepare_items_using_amazon(@list.list_items)

		if @list.save
			flash[:success] = "List was successfully created."
			redirect_to @list
		else
			render "new"
		end
	end

	def edit
		@list = List.friendly.find(params[:id])
	end

	def update
		@list = List.friendly.find(params[:id])
		if @list.update_attributes(list_params)
			flash[:success] = "Updated list successfully"
			redirect_to list_path(@list)
		else
			render "edit"
		end
	end

	private

	def list_params
		params.require(:list).permit(:name, :description, list_items_attributes: [:id, :title, :author, :isbn, :is_ebook, :website, :image_link, :categories, :_destroy])
	end

	# Lookup Books by ISBN on Amazon's Product Advertising API
	def prepare_items_using_amazon(items)
		isbns = []
		items.each do |item|
			isbns << item.isbn
		end

		amazon_books_by_isbns(isbns).each do |item|
			if item["ItemAttributes"]["ISBN"].present? || item["ItemAttributes"]["EISBN"].present?
				if item["ItemAttributes"]["ISBN"].present?
					isbn = item["ItemAttributes"]["ISBN"]
				elsif item["ItemAttributes"]["EISBN"].present?
					isbn = item["ItemAttributes"]["EISBN"]
				end

				ean = item["ItemAttributes"]["EAN"]
				if @list.list_items.select { |item| item.isbn == isbn or item.isbn == ean }.present?
					mod_item = @list.list_items.select { |item| item.isbn == isbn or item.isbn == ean }.first
					mod_item.website = stringify(item["DetailPageURL"])
					mod_item.title = stringify(item["ItemAttributes"]["Title"])
					mod_item.author = stringify(item["ItemAttributes"]["Author"])
				end
			end
		end
	end

	def amazon_books_by_isbns(isbns)
		AmazonBooksService.new({
			isbns: isbns
		}).search
	end

	def stringify(item)
		if item.kind_of?(Array)
			item.join(", ")
		else
			item
		end
	end

	def create_unique_identifier
	  begin
	    unique_identifier = SecureRandom.hex(5)
	  end while List.exists?(unique_identifier: unique_identifier)
	  return unique_identifier
	end
end