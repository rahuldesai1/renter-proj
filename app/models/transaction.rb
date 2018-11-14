class Transaction < ApplicationRecord
  belongs_to :user, :foreign_key => 'seller_id'
  belongs_to :user, :foreign_key => 'renter_id'
  belongs_to :product
end
