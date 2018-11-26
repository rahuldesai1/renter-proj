class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@products = Product.find_by_owner_id(current_user)
		@transactions = Transaction.find_by_renter_id(current_user)
		if not current_user.balance
			current_user.balance = 0
		end
	end

	def createusername
		current_user.username = params[:username]
		current_user.save
		redirect_to users_path
		return 
	end

	def addbalance
		input = params[:balance].to_f
		if current_user.balance
			current_user.balance += input
		else
			current_user.balance = input
		end
		current_user.save
		redirect_to users_path
		return 
	end



end
