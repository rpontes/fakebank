# FakeBank
> Fake Bank is application to manage banks accounts, getting balance and transfers money between clients.

## Getting Started
This application is structured as follows:

### Models
* **Account**: bank account from a client;
* **Trader**: where transfers will save amount

### Services

* **AccountService**: responsible for manage a account
  * **balance**: sum and reduce all amounts from account trades


* **TransferMoneyService**: responsible for create trades between accounts
  * **transfer**: create two trades, one who sent money and another who receive money

## Requiriments
  * Ruby
  * Yarn - [Install](https://yarnpkg.com/lang/en/docs/install/)

## Development setup
To start a develop on this project, follow this steps:

### Install
```sh
  git clone https://github.com/rpontes/fakebank
  cd fakebank
```

After that you need install all dependencies, create and populate database.

```sh
  bundle install
  yarn install
  rails db:create
  rails db:migrate
  rails db:seed
```

### Run
And run locally

```sh
  rails s -b 0.0.0.0 thin
  open http://127.0.0.1:3000
```

## Running the tests
```sh
  rspec
```


## License
MIT © [Ricardo Pontes](https://github.com/rpontes)
