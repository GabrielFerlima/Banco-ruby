class SaldoUseCase
  def initialize(client:)
    @client = client
  end

  def execute
    positive_value = @client.moviments.where(role: [:deposito, :transferencia_recebida]).sum(:value)
    negative_value = @client.moviments.where(role: [:saque, :transferencia_enviada]).sum(:value)

    positive_value - negative_value
  end
end
