class AddCompanyToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :company, foreign_key: true
  end
end
