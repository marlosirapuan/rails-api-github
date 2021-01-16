# frozen_string_literal: true

require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.describe 'Api::V1::SearchRepositories', type: :request do
  let(:user)    { create(:user) }
  let(:header)  { { 'Authorization' => JsonWebToken.encode(user_id: user.id) } }

  let(:search_params) { { term: 'rails', language: 'ruby', page: 1, per_page: 5 } }

  describe 'GET /search_repositories' do
    context 'when pass valid params' do
      before do
        VCR.use_cassette('search_found_repositories') do
          get '/api/v1/search_repositories', params: search_params,
                                             headers: header
        end
      end

      it 'returns status code 200 (ok)' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns repositories' do
        response_json = JSON.parse(response.body)
        expect(response_json['data']).to have_key('repositories')
      end

      it 'returns total repositories' do
        response_json = JSON.parse(response.body)
        expect(response_json.dig('data', 'paginate', 'total_count')).to be > 1
      end

      it 'returns current page' do
        response_json = JSON.parse(response.body)
        expect(response_json.dig('data', 'paginate', 'page')).to eq(1)
      end

      it 'returns current per_page' do
        response_json = JSON.parse(response.body)
        expect(response_json.dig('data', 'paginate', 'per_page')).to eq(5)
      end

      it 'returns total pages' do
        response_json = JSON.parse(response.body)
        expect(response_json.dig('data', 'paginate', 'pages')).to be > 1
      end
    end

    context 'when not finding results' do
      let(:search_params) { { term: 'xptoxx123' } }

      before do
        VCR.use_cassette('search_none_repositories') do
          get '/api/v1/search_repositories', params: search_params,
                                             headers: header
        end
      end

      it 'returns status code 404 (not_found)' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns none repositories' do
        response_json = JSON.parse(response.body)
        expect(response_json['data']).to eq(nil)
      end
    end
  end
end
