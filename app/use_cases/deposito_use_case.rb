class DepositoUseCase
  def initialize(client:)
    @client = client
  end

  def execute(value:)
    raise "Informe um valor" unless value.present?
    raise "Informe um valor" if value.present? && !value.to_d.positive?

    Moviment.create!(
      date: Date.today,
      client: @client,
      value: value.to_d,
      role: :deposito
    )
  end
end
