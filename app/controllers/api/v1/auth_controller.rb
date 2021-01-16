# frozen_string_literal: true

module Api
  module V1
    class AuthController < ApplicationController
      skip_before_action :authenticate_user

      def create
        ::Auth::Flow
          .call(params: params)
          .on_failure(:not_authorized) { |error| render_json(401, error: error[:message]) }
          .on_success { |result| render_json(200, token: result[:token]) }
      end
    end
  end
end
