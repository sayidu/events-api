# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:event, 10)
      get '/api/events', headers: { 'Authorization' => random_bearer_token }
    end

    it 'returns all events' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before do
      event = FactoryBot.create(:event, name: 'Event 101')
      get "/api/events/#{event.id}", headers: { 'Authorization' => random_bearer_token }
    end

    it 'returns event' do
      expect(json['name']).to eq('Event 101')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'when event is created with required values' do
      before do
        post '/api/events', headers: { 'Authorization' => random_bearer_token },
                            params: {
                              event: { name: 'Event Testing', start_date: Time.now, end_date: Time.now }
                            }
      end

      it 'returns event with accurate fields' do
        expect(json['name']).to eq('Event Testing')
      end

      it 'response returns the created status code' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when event is created without required values' do
      before do
        post '/api/events', headers: { 'Authorization' => random_bearer_token },
                            params: { event: { name: 'Event Testing' } }
      end

      it 'returns event with accurate fields' do
        expect(json['errors']).to eq("Start date can't be blank,End date can't be blank")
      end

      it 'response returns the unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /update' do
    let(:user) { FactoryBot.create(:user) }
    let(:event) { FactoryBot.create(:event, name: 'Event 101', user: user) }

    context 'when event is updated with permitted values' do
      before do
        put "/api/events/#{event.id}", headers: { 'Authorization' => random_bearer_token(user) },
                                       params: { event: { name: 'Event 102' } }
      end

      it 'returns event with accurate fields' do
        expect(json['name']).to eq('Event 102')
      end

      it 'response returns the created status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when event is updated without permitted values' do
      before do
        put "/api/events/#{event.id}", headers: { 'Authorization' => random_bearer_token(user) },
                                       params: { event: { start_date: nil } }
      end

      it 'returns event with accurate fields' do
        expect(json['errors']).to eq("Start date can't be blank")
      end

      it 'response returns the unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
