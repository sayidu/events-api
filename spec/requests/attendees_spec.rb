# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Attendee', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event) }

  describe 'GET /index' do
    before do
      FactoryBot.create_list(:attendee, 10, event: event)
      get "/api/events/#{event.id}/attendees", headers: { 'Authorization' => random_bearer_token }
    end

    it 'returns all attendees' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:attendee) { FactoryBot.create(:attendee) }

    before do
      get "/api/events/#{event.id}/attendees/#{attendee.id}",
          headers: { 'Authorization' => random_bearer_token(attendee.user) }
    end

    it 'returns event_id' do
      expect(json['event_id']).to eq(attendee.event_id)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'when attendee is created with required values' do
      let(:event) { FactoryBot.create(:event, id: '444') }

      before do
        post "/api/events/#{event.id}/attendees", headers: { 'Authorization' => random_bearer_token },
                                                  params: { attendee: { event_id: event.id } }
      end

      it 'returns attendee with accurate fields' do
        expect(json['event_id']).to eq(444)
      end

      it 'response returns the created status code' do
        expect(response).to have_http_status(:created)
      end
    end
  end

  describe 'DELETE /destroy' do
    let(:attendee) { FactoryBot.create(:attendee, event: event, user: user) }

    context 'when attendee is delete' do
      before do
        delete "/api/events/#{event.id}/attendees/#{attendee.id}",
               headers: { 'Authorization' => random_bearer_token(user) }
      end

      it 'response returns the no_content status code' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
