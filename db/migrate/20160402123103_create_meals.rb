class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals, id: :uuid do |t|
    	t.uuid :day_id, null: false, index: true
    	t.string :title, null: false
    	t.text :image
      t.timestamps
    end
  end
end
