class ExtratoUseCase
  def initialize(client:)
    @client = client
  end

  def execute(start_date:, end_date:)
    @client.moviments.where(date: start_date..end_date)
  end
end
