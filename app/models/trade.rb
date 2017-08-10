# Model to save all trades from application
class Trade < ApplicationRecord
  belongs_to :account

  validates :account_id, :amount, presence: true
  validates :amount, numericality: true
end
