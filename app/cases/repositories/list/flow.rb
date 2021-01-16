# frozen_string_literal: true

module Repositories
  module List
    class Flow < Micro::Case
      flow Steps::ValidateQueryParams,
           Steps::BuildQueryParams,
           Steps::Filter
    end
  end
end
