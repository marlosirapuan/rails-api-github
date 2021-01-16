# frozen_string_literal: true

module Repositories
  module Search
    class Flow < Micro::Case
      flow Steps::ValidateQueryParams,
           Steps::BuildQueryParams,
           Steps::Filter
    end
  end
end
