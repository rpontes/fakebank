# Service to transfer money from source to destination.
class TransferMoneyService
  # Initialize service with source, destination and amount to transfer
  #
  # * *Args*:
  #   - +source_account_id+ -> source of money
  #   - +destination_account_id+ -> destination of money
  #   - +amount+ -> amount to transfer
  #
  def initialize(source_account_id, destination_account_id, amount)
    @source_account_id = source_account_id
    @destination_account_id = destination_account_id
    @amount = amount.present? ? amount.to_f : 0
  end

  # Method to do a transfer.
  #
  # * *Returns*:
  #   - true if can do the transfer and false if has a problem.
  #
  def transfer
    return false if @source_account_id == @destination_account_id
    return false unless @amount > 0
    return false unless Account.exists?(@source_account_id) &&
                        Account.exists?(@destination_account_id)
    return false if AccountService.new(@source_account_id).balance < @amount

    create_traders
  end

  private

  def create_traders
    ActiveRecord::Base.transaction do
      Trade.create!(account_id: @source_account_id, amount: - @amount)
      Trade.create!(account_id: @destination_account_id, amount: @amount)
    end
  end
end
