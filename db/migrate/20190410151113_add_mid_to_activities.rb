class AddMidToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :mid, :string
  end
end
