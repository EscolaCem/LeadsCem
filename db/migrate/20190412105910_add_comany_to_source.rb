class AddComanyToSource < ActiveRecord::Migration[5.2]
  def change
    add_reference :sources, :company, foreign_key: true
  end
end
