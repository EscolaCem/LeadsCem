class AddResponsibleToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :responsible, foreign_key: true
  end
end
