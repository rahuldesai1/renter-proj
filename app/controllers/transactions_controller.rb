class TransactionsController < ApplicationController
	def index

	end

	def make
		@product = Product.find(params[:product])
		transaction = Transaction.create(
			seller_id: @product.owner_id,
			product_id: @product.id,
			duration: Date.new(2001,2,3),
			status: false,
			created_at: DateTime.now,
			updated_at: DateTime.now,
			renter_id: current_user.id)
		if !transaction.valid?
            flash[:error] = transaction.errors.full_messages.to_sentence
            redirect_to product_path(:id => @product)
        else
            redirect_to transaction_path
        end

	end
end
