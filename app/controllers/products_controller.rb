class ProductsController < ApplicationController
	def index
		@product = Product.find(params[:id])
		@user = User.find(@product.owner_id)
	end

	def new
	end
end
