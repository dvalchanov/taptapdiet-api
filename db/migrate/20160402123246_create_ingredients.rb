class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients, id: :uuid do |t|
    	t.uuid :meal_id, null: false, index: true
    	t.string :title, null: false
      t.timestamps
    end
  end
end
