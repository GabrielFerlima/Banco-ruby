class StatementsController < ApplicationController
  before_action :set_client

  def new
  end

  def create
    extrato = ExtratoUseCase.new(client: @client)
    @moviments = extrato.execute(start_date: params[:start_date], end_date: params[:end_date])

    render :create, status: :ok
  end


  private

  def set_client
    @client = Client.find(params[:client_id])
  end
end
