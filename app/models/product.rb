class Product < ApplicationRecord
  belongs_to :user, :foreign_key => 'owner_id'
  has_many :reviews
  has_many :transactions
end
