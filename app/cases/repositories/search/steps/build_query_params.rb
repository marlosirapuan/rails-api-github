# frozen_string_literal: true

class Repositories::Search::Steps::BuildQueryParams < Micro::Case
  attributes :params

  # rubocop: disable Metrics/AbcSize
  def call!
    search = handle_search_query

    query_params            = {}
    query_params[:q]        = search
    query_params[:page]     = params[:page].to_i
    query_params[:per_page] = params[:per_page].to_i
    query_params[:sort]     = params[:sort]
    query_params[:order]    = params[:order]

    Success(:success, result: { params: query_params })
  end
  # rubocop: enable Metrics/AbcSize

  private

  # https://docs.github.com/en/rest/reference/search#search-repositories
  def handle_search_query
    search = ''
    search += "#{params[:term]}+" if params[:term].present?
    search += "user:#{params[:username]}+" if params[:username].present?
    search += "language:#{params[:language]}+"
    search
  end
end
