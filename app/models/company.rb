class Company < ApplicationRecord
has_many :user
has_many :ticket
has_many :client
has_many :course
end
