# Class to model Account
class Account < ApplicationRecord
  has_many :traders
end
