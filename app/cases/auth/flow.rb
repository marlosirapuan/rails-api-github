# frozen_string_literal: true

module Auth
  class Flow < Micro::Case
    flow Steps::ValidateParams,
         Steps::AuthenticateUser
  end
end
