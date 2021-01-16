# frozen_string_literal: true

class Repositories::List::Steps::BuildQueryParams < Micro::Case
  attributes :params

  def call!
    query_params            = {}
    query_params[:q]        = "is:#{params[:type]}"
    query_params[:page]     = params[:page]
    query_params[:per_page] = params[:per_page]

    Success(:success, result: { params: query_params })
  end
end
