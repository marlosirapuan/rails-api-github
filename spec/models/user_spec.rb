# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }

    it 'is invalid email' do
      user.email = 'user@.gmail.com'
      expect(user.valid?).to be(false)
    end

    it 'is valid email' do
      user.email = 'user@email.com'
      expect(user.valid?).to be(true)
    end
  end
end
