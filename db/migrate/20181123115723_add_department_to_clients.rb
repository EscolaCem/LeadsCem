class AddDepartmentToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :department, :string
  end
end
