class RemoveProblemFromTicket < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :problem, :string
  end
end
