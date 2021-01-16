# frozen_string_literal: true

class Repositories::List::Steps::ValidateQueryParams < Micro::Case
  DEFAULT_PAGE      = 1
  DEFAULT_PER_PAGE  = 5
  DEFAULT_TYPE      = 'public'

  attributes :params

  def call!
    query_params = {
      type: params[:type] || DEFAULT_TYPE,
      page: params[:page] || DEFAULT_PAGE,
      per_page: params[:per_page] || DEFAULT_PER_PAGE
    }

    Success(:success, result: { params: query_params })
  end
end
