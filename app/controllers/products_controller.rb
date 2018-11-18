class ProductsController < ApplicationController
	def index
		@product = Product.find(params[:id])
		@user = User.find(@product.owner_id)
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
			updated_at: DateTime.now)

		redirect_to home_path

	end
end
