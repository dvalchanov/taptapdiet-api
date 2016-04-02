class CreateAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :access_tokens, id: :uuid do |t|
    	t.uuid :user_id, null: false, index: true
    	t.text :token, null: false
    	t.datetime :expires_at, null: false
      t.timestamps
    end
  end
end
