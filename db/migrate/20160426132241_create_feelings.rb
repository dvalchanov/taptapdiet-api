class CreateFeelings < ActiveRecord::Migration[5.0]
  def change
    create_table :feelings, id: :uuid do |t|
      t.uuid :day_id, null: false, index: true
      t.integer :value, null: false
      t.timestamps
    end
  end
end
