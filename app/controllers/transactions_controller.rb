class TransactionsController < ApplicationController
	def index
		@product = Product.find(params[:product])
		@date = Date.parse(params[:duration][0])
	end

	def make
		product = Product.find(params[:product])
		cost = params[:cost].to_i
		date = params[:date]

		if current_user.balance - cost > 0
			current_user.update(balance: current_user.balance - cost)
			product.update(available: false)
			transaction = Transaction.create(
				seller_id: product.owner_id,
				product_id: product.id,
				duration: date,
				status: false,
				created_at: DateTime.now,
				updated_at: DateTime.now,
				renter_id: current_user.id)
			if !transaction.valid?
	            flash[:error] = transaction.errors.full_messages.to_sentence
	            redirect_to product_path(:id => @product)
	        else
	            redirect_to users_path, notice: "Purchase succeeded!"
	        end
		else
			redirect_to users_path, alert: "Purchase failed. Low balance."
		end

        return

	end
end
