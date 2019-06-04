class AddMidToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :mid, :string
  end
end
