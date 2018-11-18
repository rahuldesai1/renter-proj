class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@products = Product.find_by_owner_id(current_user)
		@transactions = Transaction.find_by_renter_id(current_user)
	end



end
