class Moviment < ApplicationRecord
  belongs_to :client
  belongs_to :client_origin, class_name: "Client", optional: true

  enum role: {
    saque: 1,
    deposito: 2,
    transferencia_enviada: 3,
    transferencia_recebida: 4
  }

  validates :role, presence: true
  validates :value, presence: true
  validates :date, presence: true
  validates :client_origin_id, presence: true, if: :transfer?

  private

  def transfer?
    role.include?("transferencia")
  end
end
