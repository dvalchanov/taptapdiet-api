require 'rails_helper'

resource 'Days', type: :api do
  resource 'Feelings', type: :api do
    post '/api/v1/days/:day_id/feelings' do
      example 'Create a feeling (successfully)' do
        day = create :day, user: current_user
        attributes = { feeling: attributes_for(:feeling) }

        request_with_auth(day_id: day.id, feeling: attributes, feeling: { value: 3 })

        expect(status).to eq 200
        expect(json[:feeling][:id]).to be_present
        expect(json[:feeling][:value]).to eq 3

        expect(day.feelings.count).to eq 1
      end
    end

    put "/api/v1/days/:day_id/feelings/:id" do
      parameter :id, 'The numeric ID of the Plant you want to update', required: true

      example 'Update a feeling (successfully)' do
        feeling = create :feeling, day: day

        request_with_auth(id: feeling.id, day_id: day.id, feeling: { value: 3} )

        expect(status).to eq 204
      end
    end

  end
end

