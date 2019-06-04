class AddSourceToTicket < ActiveRecord::Migration[5.2]
  def change
    add_reference :tickets, :source, foreign_key: true
  end
end
