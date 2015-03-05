class ListsController < ApplicationController
	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
	end

	def new
		@list = List.new
		@list.list_items.build
	end

	def create
		@list = List.new(list_params)
		if @list.save
			flash[:success] = "List was successfully created."
			redirect_to @list
		else
			render "new"
		end
	end

	private

	def list_params
		params.require(:list).permit(:title, list_items_attributes: [:id, :name, :_destroy])
	end
end
