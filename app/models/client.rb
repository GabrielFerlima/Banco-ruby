class Client < ApplicationRecord
  has_many :moviments

  enum status: {
    active: 1,
    inactive: 2
  }

  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :password, presence: true
end
