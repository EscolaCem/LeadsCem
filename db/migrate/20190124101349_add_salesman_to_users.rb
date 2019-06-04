class AddSalesmanToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :salesman, :boolean
  end
end
