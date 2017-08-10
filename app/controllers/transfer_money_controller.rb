# Controller to transfer money
class TransferMoneyController < ApplicationController
  def new; end

  def create
    service = TransferMoneyService.new(params[:source_account_id],
                                       params[:destination_account_id],
                                       params[:amount])

    if service.transfer
      flash[:notice] = t('transfer_money.success')
    else
      flash[:error] = t('transfer_money.error')
    end

    redirect_to root_path
  end
end
