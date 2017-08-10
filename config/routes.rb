Rails.application.routes.draw do
  root 'trades#index'

  get '/accounts/balance', to: 'accounts#balance'
  post '/transfer_money', to: 'transfer_money#create'

  resources :trades, only: :index
end
