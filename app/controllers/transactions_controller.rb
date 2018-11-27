class TransactionsController < ApplicationController
	def index
		@product = Product.find(params[:product])
		if params[:duration].all?(&:blank?)
			redirect_to product_path(:id => @product), alert: "Please specify a date"
		else
			@date = Date.parse(params[:duration][0])
		end
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

	def return
		product = Product.find(params[:product])
		transaction = Transaction.where("product_id = :prod and status = :status", {prod: params[:product], status: false})
		transaction.update(status: true)
		product.update(available: true)
		redirect_to users_path, notice: "Product returned to owner"
	end
end
