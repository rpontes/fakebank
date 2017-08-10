# Controller to traders
class TradersController < ApplicationController
  def index
    @traders = Trade.order(:created_at)
  end
end
