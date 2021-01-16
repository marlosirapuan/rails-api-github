# frozen_string_literal: true

class Auth::Steps::ValidateParams < Micro::Case
  attributes :params

  def call!
    # TODO: validates params here

    Success(:success, result: { params: params })
  end
end
