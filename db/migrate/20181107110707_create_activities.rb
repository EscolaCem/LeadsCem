class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.text :description
      t.datetime :date
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
