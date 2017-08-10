require 'rails_helper'

describe 'Transfer Money', type: :feature do
  before do
    @account = Account.create!

    4.times do
      account = Account.create!

      Trade.create!(account: account, amount: - 10.0)
      Trade.create!(account: @account, amount: 10.0)
    end

    visit root_path
  end

  it 'get balance from a account' do
    destination = Account.create!

    expect(page).to have_content 'Transferir'

    within('form#transfer_money') do
      fill_in 'Origem', with: @account.id
      fill_in 'Destino', with: destination.id
      fill_in 'Valor', with: 10.0
    end

    click_button 'Transferir'

    balance_source = AccountService.new(@account.id).balance
    balance_destination = AccountService.new(destination.id).balance

    expect(page).to have_content 'Transferencia realizadas com sucesso!'
    expect(balance_source).to eq(30.0)
    expect(balance_destination).to eq(10.0)
  end

  it 'shows error when account not exists' do
    expect(page).to have_content 'Transferir'

    within('form#transfer_money') do
      fill_in 'Origem', with: @account.id
      fill_in 'Destino', with: 99
      fill_in 'Valor', with: 10.0
    end

    click_button 'Transferir'

    balance_source = AccountService.new(@account.id).balance

    expect(page).to have_content 'Problemas ao tentar transferir!'
    expect(balance_source).to eq(40.0)
  end

  it 'shows error when account not exists' do
    destination = Account.create

    expect(page).to have_content 'Transferir'

    within('form#transfer_money') do
      fill_in 'Origem', with: @account.id
      fill_in 'Destino', with: destination.id
      fill_in 'Valor', with: 0
    end

    click_button 'Transferir'

    balance_source = AccountService.new(@account.id).balance

    expect(page).to have_content 'Problemas ao tentar transferir!'
    expect(balance_source).to eq(40.0)
  end

  it 'shows error when balance less than amount' do
    destination = Account.create

    expect(page).to have_content 'Transferir'

    within('form#transfer_money') do
      fill_in 'Origem', with: @account.id
      fill_in 'Destino', with: destination.id
      fill_in 'Valor', with: 50.0
    end

    click_button 'Transferir'

    balance_source = AccountService.new(@account.id).balance

    expect(page).to have_content 'Problemas ao tentar transferir!'
    expect(balance_source).to eq(40.0)
  end
end
