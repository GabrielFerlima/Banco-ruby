class DepositsController < ApplicationController
  before_action :set_client

  def new
  end

  def create
    saque = DepositoUseCase.new(client: @client)
    saque.execute(value: params[:value])

    redirect_to client_url(@client), notice: "Deposito realizado com sucesso"
  rescue => e
    @error = e.message
    render :new, status: :unprocessable_entity
  end


  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
