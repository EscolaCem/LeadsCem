class AddResponsibleToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :responsible, foreign_key: true
  end
end
