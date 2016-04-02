class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.text :fb_token, null: false
      t.text :fb_user_id, null: false
      t.text :fb_token_expiration_date, null: false
      t.text :time_zone, null: false
      t.timestamps
    end
  end
end
