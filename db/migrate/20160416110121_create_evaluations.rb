class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.uuid :day_id, null: false, index: true
      t.integer "rating", null: false
      t.timestamps
    end
  end
end
