require 'rails_helper'

resource 'Days', type: :api do
  get '/api/v1/days' do
    example 'Fetch the days for the current user' do
      days1 = create :day, user: current_user
      days2 = create :day, user: current_user

      request_with_auth

      expect(status).to eq 200
      expect(json[:days][0][:id]).to eq days2.id
      expect(json[:days][1][:id]).to eq days1.id
    end
  end
end