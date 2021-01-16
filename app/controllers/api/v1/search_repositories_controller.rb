# frozen_string_literal: true

require 'rest-client'

module Api
  module V1
    class SearchRepositoriesController < ApplicationController
      def index
        ::Repositories::Search::Flow
          .call(params: params)
          .on_failure(:parameter_missing) { |error| render_json(400, error: error[:message]) }
          .on_failure(:unprocessable_entity) { |error| render_json(402, error: error[:message]) }
          .on_failure(:no_record_found) { |error| render_json(404, error: error[:message]) }
          .on_success { |result| render_json(200, data: result[:data]) }
      end
    end
  end
end
