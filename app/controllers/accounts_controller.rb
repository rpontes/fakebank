# Controller to Account
class AccountsController < ApplicationController
  def balance
    account_id = params[:account_id]

    @balance = AccountService.new(account_id).balance

    return unless @balance == false

    flash[:error] = t('accounts.balance.not_exist')
    redirect_to trades_path
  end
end
