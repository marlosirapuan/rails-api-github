# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.describe 'Api::V1::AuthController', type: :request do
  let(:authorized_params)      { { name: 'User', email: 'demo@demo.com', password: 'demo' } }
  let(:not_authorized_params)  { { name: 'User', email: 'demo@demo.com', password: 'invalid' } }

  describe 'POST /auth' do
    context 'when pass authorized params' do
      before do
        User.create(authorized_params)
        post '/api/v1/auth', params: authorized_params
      end

      it 'returns status code 200 (ok)' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a token' do
        expect(response.body).to match(/token/)
      end
    end

    context 'when pass not authorized params' do
      before do
        post '/api/v1/auth', params: not_authorized_params
      end

      it 'returns status code 401 (unauthorized)' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'does not return a token' do
        expect(response.body).not_to match(/token/)
      end
    end
  end
end
