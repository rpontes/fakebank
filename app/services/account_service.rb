# Service to manage account
class AccountService
  # Initialize service with account want manage
  #
  # * *Args*:
  #   - +account_id+ -> account to manage
  #
  def initialize(account_id)
    @account_id = account_id
  end

  # Method to get all trades from a account and sum or reduce.
  #
  # * *Returns*:
  #   - balance from a account
  #
  def balance
    return false unless Account.exists?(@account_id)

    Trade.where(account_id: @account_id).pluck(:amount).reduce(:+) || 0.0
  end
end
