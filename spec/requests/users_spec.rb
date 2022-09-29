# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user, first_name: 'Simone') }

  describe 'GET /show' do
    before do
      get '/api/users', headers: { 'Authorization' => random_bearer_token(user) }
    end

    it 'returns user' do
      expect(json['first_name']).to eq('Simone')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'when user is created with required values' do
      before do
        post '/api/users', headers: { 'Authorization' => random_bearer_token(user) },
                           params: {
                             user: { first_name: 'Jane', email: 'jane_doe@gmail.com', password: 'password' }
                           }
      end

      it 'returns user with accurate fields' do
        expect(json['first_name']).to eq('Jane')
      end

      it 'response returns the created status code' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when user is created without required values' do
      before do
        post '/api/users', headers: { 'Authorization' => random_bearer_token(user) },
                           params: { user: { first_name: 'Jane', email: 'jane_doe@gmail.com' } }
      end

      it 'returns user with accurate fields' do
        expect(json['errors']).to include("Password can't be blank")
      end

      it 'response returns the unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /update' do
    let(:user) { FactoryBot.create(:user) }

    context 'when user is updated with permitted values' do
      before do
        put '/api/users', headers: { 'Authorization' => random_bearer_token(user) },
                          params: { user: { first_name: 'Jane' } }
      end

      it 'returns user with accurate fields' do
        expect(json['first_name']).to eq('Jane')
      end

      it 'response returns the created status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is updated without permitted values' do
      before do
        put '/api/users', headers: { 'Authorization' => random_bearer_token(user) },
                          params: { user: { first_name: '' } }
      end

      it 'returns user with accurate fields' do
        expect(json['errors']).to include("name can't be blank")
      end

      it 'response returns the unprocessable_entity status code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
