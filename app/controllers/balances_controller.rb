class BalancesController < ApplicationController
  before_action :set_client

  def index
    @saldo = SaldoUseCase.new(client: @client).execute
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
