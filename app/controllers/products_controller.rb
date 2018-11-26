class ProductsController < ApplicationController
	def index
		@product = Product.find(params[:id])
		@user = User.find(@product.owner_id)
		@review = Review.find_by(product_id: @product.id)
	end

	def new

	end

	def create
		@product = Product.new

		Product.create(name: params[:name],
			description: params[:description],
			owner_id: current_user.id,
			available: true,
			price: params[:price],
			created_at: DateTime.now,
			updated_at: DateTime.now,
			img: params[:img])

		redirect_to home_path

	end
end
