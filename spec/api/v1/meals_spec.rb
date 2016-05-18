require 'rails_helper'


resource 'Days', type: :api do
  resource 'Meals', type: :api do
    post '/api/v1/days/:day_id/meals' do
      parameter :day_id, 'The numeric ID of the Day in which you want to create a meal', required: true

      example 'Create a meal (successfully)' do
        day = create :day, user: current_user
        attributes = { meal: attributes_for(:meal) }

        request_with_auth(day_id: day.id, meal: attributes, meal: { title: "Musaka" })

        expect(status).to eq 200
        expect(json[:meal][:id]).to be_present
        expect(json[:meal][:title]).to eq 'Musaka'

        expect(day.meals.count).to eq 1
      end
    end
  end
end
