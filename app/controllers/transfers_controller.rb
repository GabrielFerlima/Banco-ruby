class TransfersController < ApplicationController
  before_action :set_client

  def new
  end

  def create
    saldo = SaldoUseCase.new(client: @client)
    extrato = TransferenciaUseCase.new(client: @client, saldo: saldo)
    extrato.execute(value: params[:value], cpf_client_origin: params[:cpf])

    redirect_to client_url(@client), notice: "Transferencia realizada com sucesso"
  rescue => e
    @error = e.message
    render :new, status: :unprocessable_entity
  end


  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
