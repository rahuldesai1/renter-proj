class ReviewsController < ApplicationController
	def index
		@product = Product.find(params[:product])
		@user = User.find(@product.owner_id)
		@review = Review.find_by(product_id: @product.id)
	end

	def create
		@product = Product.find(params[:product])
		Review.create(rating: params[:rating],
			comment: params[:comment],
			user_id: current_user.id,
			product_id: @product.id,
			created_at: DateTime.now,
			updated_at: DateTime.now)

		redirect_to home_path
	end


end