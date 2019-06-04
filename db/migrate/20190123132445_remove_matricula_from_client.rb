class RemoveMatriculaFromClient < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :matricula, :integer
  end
end
