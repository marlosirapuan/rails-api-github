# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  REGEX_EMAIL =
    /\A([\w+\-].?)+@[a-z0-9\d\-]+(\.[a-z0-9]+)*\.[a-z0-9]+\z/i.freeze

  with_options presence: true do
    validates :name
    validates :email
    validates :password_digest
  end
  validates :email, format: REGEX_EMAIL
end
