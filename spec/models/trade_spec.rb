require 'rails_helper'

describe Trade, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:account_id) }
    it { should validate_presence_of(:amount) }
  end
end
