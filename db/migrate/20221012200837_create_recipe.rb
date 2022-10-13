class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :preparation_time
      t.string :cooking_time
      t.references :user, foreign_key: true
      t.boolean :public
  
      t.timestamps
    end
  end
end
