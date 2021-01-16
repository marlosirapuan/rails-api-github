# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name                  { FFaker::Name.name }
    email                 { FFaker::Internet.email }
    password              { '12345' }
    password_confirmation { '12345' }
  end
end
