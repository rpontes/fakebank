source_account = Account.create
destination_account = Account.create

Trade.create(account: source_account, amount: - 100)
Trade.create(account: destination_account, amount: 100)

source_account = destination_account
destination_account = Account.create

Trade.create(account: source_account, amount: - 50)
Trade.create(account: destination_account, amount: 50)
