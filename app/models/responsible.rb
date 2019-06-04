class Responsible < ApplicationRecord
    has_many :tickets
    belongs_to :company 
    has_many :users
    belongs_to :user
    validates :name, uniqueness: true

end
