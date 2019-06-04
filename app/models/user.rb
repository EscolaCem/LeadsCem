  class User < ApplicationRecord
  enum kind: [:salesman, :manager, :superadmin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:validatable
  devise :timeoutable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, format: {with: /.*@.*/}
  has_many :tickets
  has_many :activities
  belongs_to :company
  has_many :clients
  belongs_to :responsible, optional: :true
end
