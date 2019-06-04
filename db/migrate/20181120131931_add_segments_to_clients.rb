class AddSegmentsToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :segments, :string
  end
end
