require 'rails_helper'

describe AccountService do
  describe '#balance' do
    before do
      @account = Account.create!

      4.times do
        account = Account.create!

        Trade.create!(account: account, amount: - 10.0)
        Trade.create!(account: @account, amount: 10.0)
      end
    end

    it 'get balance from a account' do
      response = described_class.new(@account.id).balance

      expect(response).to eq(40.0)
    end

    it 'return false when account not exists' do
      response = described_class.new(99).balance

      expect(response).to be_falsy
    end
  end
end
