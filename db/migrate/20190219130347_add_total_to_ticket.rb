class AddTotalToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :total, :decimal
  end
end
