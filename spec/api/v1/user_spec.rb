require 'rails_helper'

resource 'Users', type: :api do
  post '/api/v1/users' do
    parameter :fb_user_id, 'Facebook User ID', required: true, scope: :user
    parameter :fb_token, 'Facebook oAuth Token', required: true, scope: :user
    parameter :fb_token_expiration_date, 'Facebook token expiration date', required: true, scope: :user

    example 'Sign up a user with Facebook' do
      attributes = { user: attributes_for(:user) }
      request_without_auth(attributes)

      expect(status).to eq 201
      expect(User.find_by(fb_user_id: attributes[:user][:fb_user_id])).to be_present
    end

    example 'Sign in a user' do
      attributes = attributes_for(:user)
      User.create!(attributes)

      request_without_auth(user: attributes)

      expect(status).to eq 200
      expect(User.count).to eq 1
      expect(json[:current_user][:token]).to eq User.last.access_tokens.by_date.first.token
    end
  end
end
