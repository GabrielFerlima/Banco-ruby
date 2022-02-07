class TransferenciaUseCase
  def initialize(client:, saldo:)
    @client = client
    @saldo = saldo
  end

  def execute(value:, cpf_client_origin:)
    saldo = @saldo.execute

    raise "Saldo insuficiente" if saldo.zero?
    raise "Valor invalido" unless value.present?
    raise "valor invalido" if value.present? && !value.to_d.positive?

    value_and_tax = value.to_d + tax(value)

    raise "Saldo insuficiente" if value_and_tax > saldo

    client_origin = Client.find_by(cpf: cpf_client_origin)

    raise "Conta inexistente" unless client_origin.present?

    Moviment.create(
      role: :transferencia_enviada,
      value: value_and_tax,
      client: @client,
      date: Date.today,
      client_origin: client_origin
    )

    Moviment.create(
      role: :transferencia_recebida,
      value: value.to_d,
      date: Date.today,
      client: client_origin,
      client_origin: @client
    )

  end

  private

  def tax(value)
    current_datetime = Time.now
    hour = current_datetime.hour
    week = current_datetime.to_date.wday

    tax = [1,2,3,4,5].include?(week) && hour >= 9 && hour <= 18 ? 5 : 7
    tax += 10 if value.to_d > 1000

    tax
  end
end
