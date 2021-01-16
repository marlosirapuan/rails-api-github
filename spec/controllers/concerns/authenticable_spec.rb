# frozen_string_literal: true

require 'rails_helper'

class MockController
  include Authenticable
  attr_accessor :request

  def initialize
    mock_request = Struct.new(:headers)
    self.request = mock_request.new({})
  end
end

RSpec.describe Authenticable do
  let(:user) { create(:user) }

  context 'when request authentication' do
    it 'returns user from authorization token' do
      authentication = MockController.new
      authentication.request.headers['Authorization'] = JsonWebToken.encode(user_id: user.id)

      expect(authentication.current_user.id).to eq(user.id)
    end

    it 'returns none user from empty authorization token' do
      authentication = MockController.new
      authentication.request.headers['Authorization'] = nil

      expect(authentication.current_user).to be_nil
    end
  end
end
