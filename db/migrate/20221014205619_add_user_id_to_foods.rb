class AddUserIdToFoods < ActiveRecord::Migration[7.0]
  def change
   add_reference :foods, :users, foreign_key: true 
  end
end
