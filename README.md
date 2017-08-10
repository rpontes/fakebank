# FakeBank
> Application created a Fake Bank to get Balance and make transfers between accounts.

## Getting Started
Para contribuir com esse projeto,
é necessesário seguir os seguintes passos:

## About

This application contains two models:

### Models
* Account: bank account from a client;
* Trader: where transfers will save amount

### Services

* AccountService: responsible for manage a account
  * **balance**: sum and reduce all amounts from account traders

* TransferMoneyService: responsible for create traders between accounts
  * **transfer**: create two traders, one to who send money and another who receive money


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
  rails db:create
  rails db:seed
```

### Run
And run localy

```sh
  rails s
```

## Running the tests
To run tests on application:

```sh
  rspec
```


## License
MIT © [Ricardo Pontes](https://github.com/rpontes)
