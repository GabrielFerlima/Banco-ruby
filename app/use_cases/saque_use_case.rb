class SaqueUseCase
  def initialize(client:, saldo:)
    @client = client
    @saldo = saldo
  end

  def execute(value:)
    saldo = @saldo.execute

    raise "Informe um valor" unless value.present?
    raise "Informe um valor" if value.present? && !value.to_d.positive?
    raise "Saldo insuficiente" if value.to_d > saldo

    Moviment.create(
      date: Date.today,
      value: value.to_d,
      client: @client,
      role: :saque
    )
  end
end
