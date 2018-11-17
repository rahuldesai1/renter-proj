class TransactionsController < ApplicationController
	def index

	end

	def make
		transaction = Transaction.create(seller: @product.owner_id, product: @product, duration: 2, status: False, renter: @currnt_user)
		redirect_to transaction_path
	end
end
