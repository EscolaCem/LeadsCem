class AddQuestionToTicket < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :question, :string
  end
end
