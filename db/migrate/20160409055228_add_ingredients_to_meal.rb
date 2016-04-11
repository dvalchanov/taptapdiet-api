class AddIngredientsToMeal < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :ingredients, :text
  end
end
