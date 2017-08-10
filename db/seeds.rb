source_account = Account.create
destination_account = Account.create

Trade.create(account: source_account, amount: - 10)
Trade.create(account: destination_account, amount: 10)
