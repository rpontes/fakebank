require 'rails_helper'

describe 'Get balance', type: :feature do
  before do
    @account = Account.create!

    4.times do
      account = Account.create!

      Trade.create!(account: account, amount: - 10.0)
      Trade.create!(account: @account, amount: 10.0)
    end

    @balance = AccountService.new(@account.id).balance

    visit root_path
  end

  it 'get balance from a account' do
    expect(page).to have_content 'Consulta Saldo'

    within('form#get_balance') do
      fill_in 'Conta', with: @account.id
    end

    click_button 'Consulta Saldo'

    expect(page).to have_content "Conta #{@account.id}"
    expect(page).to have_content 'Saldo atual: '\
      "#{ActionController::Base.helpers.number_to_currency(@balance)}"
  end

  it 'shows error when account not exists' do
    expect(page).to have_content 'Consulta Saldo'

    within('form#get_balance') do
      fill_in 'Conta', with: 99
    end

    click_button 'Consulta Saldo'

    expect(page).to_not have_content "Conta #{@account.id}"
    expect(page).to have_content 'Conta não existe!'
  end
end
