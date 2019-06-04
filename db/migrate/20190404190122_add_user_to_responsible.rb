class AddUserToResponsible < ActiveRecord::Migration[5.2]
  def change
    add_reference :responsibles, :user, foreign_key: true
  end
end
