class ChangeIntegerLimitInYourTable < ActiveRecord::Migration[4.2]
   def change
     change_column :clients, :matricula, :integer, limit: 8
   end
 end
