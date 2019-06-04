class AddTelephoneToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :telephone, :string
  end
end
