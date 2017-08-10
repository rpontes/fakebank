require 'rails_helper'

describe TransferMoneyService do
  describe '#transfer' do
    before do
      @account = Account.create!

      4.times do
        account = Account.create!

        Trade.create!(account: account, amount: - 10.0)
        Trade.create!(account: @account, amount: 10.0)
      end
    end

    it 'transfer money from source to destination' do
      destination = Account.create!

      described_class.new(@account.id, destination.id, 10.0).transfer

      balance = AccountService.new(destination.id).balance

      expect(balance).to eq(10.0)
    end

    it 'return false when account not exists' do
      response = described_class.new(@account.id, 99, 10.0).transfer

      expect(response).to be_falsy
    end

    it 'return false when amount less than zero' do
      destination = Account.create!

      response = described_class.new(@account.id, destination.id, 0).transfer

      expect(response).to be_falsy
    end

    it 'return false when send same accounts ' do
      response = described_class.new(@account.id, @account.id, 10.0).transfer

      expect(response).to be_falsy
    end
  end
end
