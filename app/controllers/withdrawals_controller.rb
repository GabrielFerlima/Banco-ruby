class WithdrawalsController < ApplicationController
  before_action :set_client

  def new
  end

  def create
    saldo = SaldoUseCase.new(client: @client)
    saque = SaqueUseCase.new(client: @client, saldo: saldo)
    saque.execute(value: params[:value])

    redirect_to client_url(@client), notice: "Saque realizado com sucesso"
  rescue => e
    @error = e.message
    render :new, status: :unprocessable_entity
  end

  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
