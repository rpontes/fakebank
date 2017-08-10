# Controller to trades
class TradesController < ApplicationController
  def index
    @traders = Trade.order(created_at: :desc)
  end
end
