class AddLastNameToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :last_name, :string, :default => 0
  end
end
