# frozen_string_literal: true

class Repositories::List::Steps::BuildQueryParams < Micro::Case
  DEFAULT_PAGE      = 1
  DEFAULT_PER_PAGE  = 10
  DEFAULT_TYPE      = 'public'

  attributes :params

  def call!
    query_params            = {}
    query_params[:q]        = "is:#{params[:type]}"
    query_params[:page]     = params[:page] || DEFAULT_PAGE
    query_params[:per_page] = params[:per_page] || DEFAULT_PER_PAGE

    Success(:success, result: { params: query_params })
  end
end
