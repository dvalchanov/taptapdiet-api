require 'rails_helper'

resource 'Days', type: :api do
  resource 'Meals', type: :api do
    post '/api/v1/days/:day_id/meals' do
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

    put '/api/v1/days/:day_id/meals/:id' do 
      parameter :id, 'The numeric ID of the Plant you want to update', required: true

      example 'Update a meal (successfully)' do
        meal = create :meal, day: day

        request_with_auth(id: meal.id, day_id: day.id, meal: { title: 'Musaka'} )

        expect(status).to eq 204
      end
    end

    delete '/api/v1/days/:day_id/meals/:id' do
      parameter :id, 'The numeric ID of the Plant you want to delete', required: true

      example 'Delete a meal' do
        meal = create :meal, day: day

        request_with_auth(id: meal.id, day_id: day.id)

        expect(status).to eq 204
      end
    end

  end
end

