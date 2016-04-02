class CreateDays < ActiveRecord::Migration[5.0]
  def change
    create_table :days, id: :uuid do |t|
    	t.uuid :user_id, null: false, index: true
      t.timestamps
    end
  end
end
