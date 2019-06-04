class Client < ApplicationRecord
  has_many :tickets
  has_many :activities
  belongs_to :user
  belongs_to :company

  validates :name,:matricula, presence: true
  validates :matricula, length: { in: 7..8 } , numericality: { only_integer: true }
  validates :email, format: {with: /.*@.*/}
  validates :matricula, uniqueness: true
  validates :status, :telephone, :name, :email, :question, presence: true
  validates :email, uniqueness: true

end
