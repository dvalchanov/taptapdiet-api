class DropEvaluations < ActiveRecord::Migration[5.0]
  def change
    drop_table :evaluations
  end
end
