class AddFinalToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :final, :string
  end
end
