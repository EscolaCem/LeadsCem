class AddCompanyToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :company, foreign_key: true
  end
end
