class AddMatriculaToClient < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :matricula, :string
  end
end
